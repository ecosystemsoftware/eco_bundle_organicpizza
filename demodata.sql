--
-- Data for Name: pizzas; Type: TABLE DATA; Schema: public; Owner: jon
--

INSERT INTO pizzas (id, name, description, image, slug, keywords) VALUES ('reina', 'Reina', 'Topped with a variety of seasonal mushrooms and mild Italian sausage, this autumn classic is finished with a touch of white truffle for a luxurious taste.', 'reina.jpg', 'organic-reina-pizza', '{mixed}');
INSERT INTO pizzas (id, name, description, image, slug, keywords) VALUES ('capr', 'Capricciosa', 'Our most popular mixed pizza, with a variety of meats and vegetables that is sure to please even the most demanding pizza lovers.', 'capricciosa.jpg', 'organic-mixed-pizza', '{mixed}');
INSERT INTO pizzas (id, name, description, image, slug, keywords) VALUES ('vege', 'Vegeteriana', 'A meatless pizza that will appeal to both vegetarians and non-vegetarians alike.', 'vege.jpg', 'organic-vegetarian-pizza', '{vegetarian}');
INSERT INTO pizzas (id, name, description, image, slug, keywords) VALUES ('mari', 'Marinara', 'A perfect combination of luxury fish and seafood, all freshly caught.', 'marinara.jpg', 'organic-seafood-pizza', '{seafood}');
INSERT INTO pizzas (id, name, description, image, slug, keywords) VALUES ('choz', 'Chorizo', 'Another simple classic - our superb margherita base topped generously with spicy Spanish sausage.', 'chorizo.jpg', 'organic-chorizo-pizza', '{meat}');
INSERT INTO pizzas (id, name, description, image, slug, keywords) VALUES ('mtfs', 'Meat Feast', 'The meat lovers dream - stacked high with all our meatiest ingredients.', 'meat-feast.jpg', 'organic-meat-pizza', '{meat}');
INSERT INTO pizzas (id, name, description, image, slug, keywords) VALUES ('ruco', 'Rucola', 'Heape with fresh rocket and organic mozzarella di bufala and topped with aged Parmesan shavings.', 'rocket.jpg', 'organic-rocket-pizza', '{vegetarian}');
INSERT INTO pizzas (id, name, description, image, slug, keywords) VALUES ('bufa', 'Bufala', 'Wow! The description is gone!', 'bufala.jpg', 'organic-bufalo-pizza', '{plain}');
INSERT INTO pizzas (id, name, description, image, slug, keywords) VALUES ('marg', 'Margherita', 'This is a really nice Margerita pizza.  Eat it!', 'margherita.jpg', 'organic-margherita-pizza', '{plain}');

--
-- Data for Name: toppings; Type: TABLE DATA; Schema: public; Owner: jon
--

INSERT INTO toppings (id, name, description, supplierref, suppliername, supplierlocation, packsizekg, servingsizeg, packprice, image, fatper100, carbsper100, protienper100, slug) VALUES ('moz', 'Italian Mozzarella', 'Our signature house mozzarella is sourced from a small organic farm in Northern Italy.', 'gdrt56', 'Cheese Co', 'Italy', 1.00, 100, 6.30, 'top-moz.jpg', 80.00, 3.00, 10.00, 'moz');
INSERT INTO toppings (id, name, description, supplierref, suppliername, supplierlocation, packsizekg, servingsizeg, packprice, image, fatper100, carbsper100, protienper100, slug) VALUES ('tom', 'House Tomato Sauce', 'Made exclusively for us by the experts at Organic Sauce Co using seasonal plum tomatoes, extra virgin olive oil and sea salt only.', 'gg45', 'Sauce Co', 'UK', 1.00, 60, 12.20, 'top-tom.jpg', 0.00, 9.00, 1.00, 'tom');
INSERT INTO toppings (id, name, description, supplierref, suppliername, supplierlocation, packsizekg, servingsizeg, packprice, image, fatper100, carbsper100, protienper100, slug) VALUES ('midsaus', 'Mild Italian Sausage', 'Our original organic mild peperoni is sourced from a 100 year old producer in Southern Italy.', '45nn', 'Sosissi', 'Italy', 0.80, 80, 9.80, 'top-mild.jpg', 50.00, 2.00, 12.00, 'midsaus');
INSERT INTO toppings (id, name, description, supplierref, suppliername, supplierlocation, packsizekg, servingsizeg, packprice, image, fatper100, carbsper100, protienper100, slug) VALUES ('spicysaus', 'Spicy Spanish Sausage', 'Our new spicy chorizo is a firebomb sure to please lovers of hot food.', 'th56', 'Chorizio', 'Spain', 0.75, 80, 7.50, 'top-chorizo.jpg', 50.00, 4.00, 13.00, 'spicysaus');
INSERT INTO toppings (id, name, description, supplierref, suppliername, supplierlocation, packsizekg, servingsizeg, packprice, image, fatper100, carbsper100, protienper100, slug) VALUES ('ham', 'Cooked Ham', 'A deliciously smooth braised ham from the alpine forests of Northern Italy - cut thick.', 'rt67fg', 'Authentico', 'Italy', 3.50, 80, 32.25, 'top-ham.jpg', 20.00, 5.00, 20.00, 'ham');
INSERT INTO toppings (id, name, description, supplierref, suppliername, supplierlocation, packsizekg, servingsizeg, packprice, image, fatper100, carbsper100, protienper100, slug) VALUES ('pep', 'Mild Fresh Peppers', 'Freshly harvested organic peppers sourced from local farmers.', '56ufghfg', 'Pepiricci', 'UK', 1.00, 50, 5.20, 'top-pep.jpg', 0.00, 1.00, 1.00, 'pep');
INSERT INTO toppings (id, name, description, supplierref, suppliername, supplierlocation, packsizekg, servingsizeg, packprice, image, fatper100, carbsper100, protienper100, slug) VALUES ('mush', 'Fresh Mushrooms', 'Seasonally foraged mushrooms available each autumn.', '5666666', 'Funghi', 'UK', 0.50, 50, 12.20, 'top-mush.jpg', 0.00, 2.00, 1.00, 'mush');
INSERT INTO toppings (id, name, description, supplierref, suppliername, supplierlocation, packsizekg, servingsizeg, packprice, image, fatper100, carbsper100, protienper100, slug) VALUES ('buf', 'Mozzarella Di Bufala', 'A stunningly soft and unctuous buffalo mozarella produced exclusively for us by Cheese Co.', '54565', 'Cheese Co', 'Italy', 1.00, 100, 9.50, 'top-buf.jpg', 85.00, 5.00, 12.00, 'buf');
INSERT INTO toppings (id, name, description, supplierref, suppliername, supplierlocation, packsizekg, servingsizeg, packprice, image, fatper100, carbsper100, protienper100, slug) VALUES ('rocket', 'Fresh Rocket', 'Grown year round for us in an ingenious hydroponic pod - this is the best rocket in the country.', '77788', 'Rocket Farm Ltd', 'UK', 0.20, 30, 2.50, 'top-rocket.jpg', 0.00, 1.00, 0.00, 'rocket');
INSERT INTO toppings (id, name, description, supplierref, suppliername, supplierlocation, packsizekg, servingsizeg, packprice, image, fatper100, carbsper100, protienper100, slug) VALUES ('pr', 'Freshly Caught Prawns', 'Daily caught prawns from cold Icelandic waters - it doesn''t get any fresher.', 'prpr', 'Iceland Prawn Co', 'Iceland', 1.00, 80, 19.50, 'top-pr.jpg', 15.00, 3.00, 18.00, 'pr');
INSERT INTO toppings (id, name, description, supplierref, suppliername, supplierlocation, packsizekg, servingsizeg, packprice, image, fatper100, carbsper100, protienper100, slug) VALUES ('tuna', 'Albacore Tuna', 'Stunning white tuna from the waters around the Italian coast.', '34t34yu', 'Tunio', 'Italy', 2.50, 90, 13.50, 'top-tuna.jpg', 5.00, 1.00, 22.00, 'tuna');
INSERT INTO toppings (id, name, description, supplierref, suppliername, supplierlocation, packsizekg, servingsizeg, packprice, image, fatper100, carbsper100, protienper100, slug) VALUES ('greenolives', 'Spanish Green Olives', 'New season Camporeal olives in a garlic marinade.', 'green323', 'Olivio', 'Spain', 3.00, 50, 9.80, 'top-green.jpg', 20.00, 1.00, 5.00, 'greenolives');
INSERT INTO toppings (id, name, description, supplierref, suppliername, supplierlocation, packsizekg, servingsizeg, packprice, image, fatper100, carbsper100, protienper100, slug) VALUES ('blackolives', 'Black Olives for me', 'Our black olives are served stone-in for the authentic experience.', 'th56h', 'Olivio', 'Spain', 4.00, 30, 12.50, 'top-black.jpg', 20.00, 11.00, 1.00, 'blackolives');
INSERT INTO toppings (id, name, description, supplierref, suppliername, supplierlocation, packsizekg, servingsizeg, packprice, image, fatper100, carbsper100, protienper100, slug) VALUES ('peas', 'These are peas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Data for Name: toppingsperpizza; Type: TABLE DATA; Schema: public; Owner: jon
--

INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'reina', 'moz', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'reina', 'tom', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'reina', 'midsaus', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'reina', 'mush', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'capr', 'moz', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'capr', 'tom', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'capr', 'mush', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'capr', 'ham', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'capr', 'blackolives', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'vege', 'moz', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'vege', 'tom', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'vege', 'mush', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'vege', 'pep', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'vege', 'greenolives', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'mari', 'moz', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'mari', 'tom', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'mari', 'pr', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'mari', 'tuna', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'choz', 'moz', 2);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'choz', 'tom', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'choz', 'spicysaus', 2);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'bufa', 'moz', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'bufa', 'tom', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'bufa', 'buf', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'bufa', 'pep', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'ruco', 'moz', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'ruco', 'tom', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'ruco', 'rocket', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'ruco', 'buf', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'mtfs', 'moz', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'mtfs', 'tom', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'mtfs', 'midsaus', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'mtfs', 'spicysaus', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'mtfs', 'ham', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'marg', 'greenolives', 1);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'marg', 'blackolives', 2);
INSERT INTO toppingsperpizza (id, pizza, topping, servings) VALUES (DEFAULT, 'marg', 'peas', 1);

--
-- Data for Name: web_categories; Type: TABLE DATA; Schema: public; Owner: jon
--

INSERT INTO web_categories (id, title, image, description, subtitle, parent, priority) VALUES ('plain', 'Plain', NULL, NULL, NULL, NULL, NULL);
INSERT INTO web_categories (id, title, image, description, subtitle, parent, priority) VALUES ('mixed', 'Mixed', NULL, NULL, NULL, NULL, NULL);
INSERT INTO web_categories (id, title, image, description, subtitle, parent, priority) VALUES ('vegetarian', 'Vegetarian', NULL, NULL, NULL, NULL, NULL);
INSERT INTO web_categories (id, title, image, description, subtitle, parent, priority) VALUES ('seafood', 'Seafood', NULL, NULL, NULL, NULL, NULL);
INSERT INTO web_categories (id, title, image, description, subtitle, parent, priority) VALUES ('meat', 'Meat', NULL, NULL, NULL, NULL, NULL);