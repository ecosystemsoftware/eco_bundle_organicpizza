--Main permissions for schema
GRANT ALL ON SCHEMA eco_bundle_organicpizza to public; GRANT ALL ON SCHEMA eco_bundle_organicpizza to anon;

CREATE TABLE pizzas (
    id text NOT NULL PRIMARY KEY,
    name text,
    description text,
    image text,
    slug text,
    keywords text[]
);

CREATE TABLE toppings (
    id text NOT NULL PRIMARY KEY,
    name text,
    description text,
    supplierref text,
    suppliername text,
    supplierlocation text,
    packsizekg numeric(35,2),
    servingsizeg integer,
    packprice numeric(35,2),
    image text,
    fatper100 numeric(35,2),
    carbsper100 numeric(35,2),
    protienper100 numeric(35,2),
    slug text
);

CREATE VIEW toppings_info AS
    SELECT toppings.*,
    packprice / ((toppings.packsizekg * 1000) / toppings.servingsizeg) as costperserving,
    (100 / toppings.servingsizeg) * toppings.fatper100 as fatperserving,
    (100 / toppings.servingsizeg) * toppings.carbsper100 as carbsperserving,
    (100 / toppings.servingsizeg) * toppings.protienper100 as protienperserving
    FROM toppings;

-- Public web pages
GRANT SELECT on TABLE toppings_info TO WEB;

CREATE TABLE toppingsperpizza (
    id serial PRIMARY KEY,
    pizza text NOT NULL references pizzas(id),
    topping text NOT NULL references toppings(id),
    servings integer
);

CREATE VIEW toppingsperpizza_info AS
    SELECT toppingsperpizza.*,
    toppings_info.name,
    toppings_info.costperserving,
    toppings_info.slug
    FROM toppingsperpizza
    LEFT JOIN toppings_info
    ON toppingsperpizza.topping = toppings_info.id;

-- Public web pages
GRANT SELECT on TABLE toppingsperpizza_info TO WEB;

CREATE VIEW pizzas_info AS
    SELECT pizzas.*,
    -- toppingsperpizza.topping,
    -- toppingsperpizza.servings,
    SUM(toppings_info.fatperserving * toppingsperpizza.servings) AS totalfat,
    SUM(toppings_info.carbsperserving * toppingsperpizza.servings) AS totalcarbs,
    SUM(toppings_info.protienperserving * toppingsperpizza.servings) AS totalprotien,
    SUM(toppings_info.costperserving * toppingsperpizza.servings) AS totalcost,
    SUM(toppings_info.costperserving * toppingsperpizza.servings) * 3 AS price
    FROM pizzas
    LEFT JOIN toppingsperpizza
    ON pizzas.id = toppingsperpizza.pizza
    LEFT JOIN toppings_info
    ON toppingsperpizza.topping = toppings_info.id
    GROUP BY pizzas.id;

-- Public web pages and anon(for functions)
GRANT SELECT on TABLE pizzas_info TO web, anon;

CREATE TABLE cartlines (
    id serial PRIMARY KEY,
    pizza_id text NOT NULL references pizzas(id),
    user_id uuid NOT NULL,
    created timestamp without time zone NOT NULL default (now() at time zone 'utc'),
    qty_ordered integer default 1,
    price numeric(35,2) NOT NULL,
    image text,
    title text
);

-- Hard restrict access to view/update/insert cartlines (remember doesnt affect views)
ALTER TABLE cartlines ENABLE ROW LEVEL SECURITY;

-- Allow anon to use the cartline sequencer
GRANT USAGE ON SEQUENCE cartlines_id_seq TO anon;

-- Allow anon access to cartlines...
GRANT SELECT, INSERT, UPDATE, DELETE on cartlines TO anon;

-- ...but restrict anon's ability to manipulate only his own cartlines
CREATE POLICY restrict_cartlines ON cartlines
USING (current_setting('my.user_id')::uuid IN (user_id));

--cart line insert logic
CREATE FUNCTION cartline_init() RETURNS trigger AS $$
DECLARE 
-- Must specify the schema name within the function, otherwise it won't find the table when it runs
    product eco_bundle_organicpizza.pizzas_info%ROWTYPE;
BEGIN
    -- Run the user id restriction
    IF current_user = 'anon' THEN
        NEW.user_id = current_setting('my.user_id')::uuid;
    END IF;
    -- Reference the item id and bring in item information to be hard coded into the line
    -- The logic of this is to make sure item info (e.g. description, price) is locked down at the time of adding
    -- the line and not cross referenced at all points in the future
    -- Must specify the schema name within the function, otherwise it won't find the table when it runs
    SELECT * INTO product FROM eco_bundle_organicpizza.pizzas_info WHERE pizzas_info.id = NEW.pizza_id;
    NEW.price := product.price;
    NEW.title := product.name;
    NEW.image := product.image;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER cartline_init
    BEFORE INSERT ON cartlines FOR EACH ROW EXECUTE PROCEDURE cartline_init();

-- View of all cartlines
CREATE VIEW cartlines_full AS
    SELECT
    o.*,
    o.price * o.qty_ordered AS total_price
    FROM cartlines o;

-- View of cartlines restricted to customer
CREATE VIEW cartlines_customer AS
    SELECT
    o.*,
    o.price * o.qty_ordered AS total_price
    FROM cartlines o
    WHERE o.user_id = current_setting('my.user_id')::uuid;

-- Grant anon the right to view their own cartlines
GRANT SELECT on cartlines_customer to anon;

-- Simple cart view talies customer cartlines
CREATE VIEW my_cart AS
	SELECT
	SUM(cl.total_price) AS order_total
	FROM cartlines_customer cl
	GROUP BY cl.user_id;

GRANT SELECT ON my_cart TO anon;

CREATE TABLE orders (
    id serial PRIMARY KEY,
    user_id uuid NOT NULL,
    created timestamp without time zone NOT NULL default (now() at time zone 'utc'),
    total numeric(35,2) NOT NULL,
    contents text,
    address text,
    phone varchar(18),
    completed boolean
);

-- Hard restrict access to view/update/insert cartlines (remember doesnt affect views)
ALTER TABLE orders ENABLE ROW LEVEL SECURITY;

-- Allow anon to use the sequencer
GRANT USAGE ON SEQUENCE orders_id_seq TO anon;

-- Allow anon access to orders (and select for return value)...
GRANT INSERT, SELECT on orders TO anon;

-- ...but restrict anon's ability to manipulate only his own orders
CREATE POLICY restrict_orders ON orders
USING (current_setting('my.user_id')::uuid IN (user_id));

--order insert logic
CREATE FUNCTION order_init() RETURNS trigger AS $$
DECLARE 
    my_cart eco_bundle_organicpizza.my_cart%ROWTYPE;
    tempContents text;
    cl eco_bundle_organicpizza.cartlines_customer%ROWTYPE;
BEGIN
    -- Run the user id restriction
    IF current_user = 'anon' THEN
        NEW.user_id = current_setting('my.user_id')::uuid;
    END IF;

    tempContents := '';

    SELECT * INTO my_cart FROM eco_bundle_organicpizza.my_cart;
    NEW.total := my_cart.order_total;

    -- Delete cartlines and compile order text
    FOR cl IN 
            SELECT * FROM eco_bundle_organicpizza.cartlines_customer
        LOOP
           tempContents := tempContents || cl.qty_ordered || ' x ' || cl.title || ' @ ' || cl.price || ' = ' || cl.total_price || '
           ';
           DELETE FROM eco_bundle_organicpizza.cartlines WHERE id = cl.id;
        END LOOP;

    NEW.contents := tempContents;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER order_init
    BEFORE INSERT ON orders FOR EACH ROW EXECUTE PROCEDURE order_init();