/////////////////////////////////////////////////
//  Some helpful basic Javascript functions to //
// to get you started with EcoSystem ///////////
////////////////////////////////////////////////

var EcoSystem = {
    "apiRoot": "http://localhost:3000"
};

//Toggles the main navigation
function toggleMainNav() {
    document.getElementById("main-nav").classList.toggle("is-active");
}

//Loads the cart on init
$(
    function() {
        refreshCart();
        refreshCartTotal();
    }
);

//Loads the pizza topping div
function loadToppings(pizzaId) {
    $.webApiGet({
        endpoint: '/eco_bundle_organicpizza/toppingsperpizza_info?pizza=%3D%27' + pizzaId + '%27',
        success: function(html) {
            $("#toppings").html(html);
        },
    });
}

//Place order
function placeOrder() {

    $.jsonApiPost({
        endpoint: '/eco_bundle_organicpizza/orders',
        data: { "phone": $('#phone').val() },
        success: function(json) {
            alert("Thanks for your order!");
            refreshCart();
            refreshCartTotal();

        },
        error: function(err) {
            alert("Could not place order");
        }
    });

    event.preventDefault();
}

//When clicking on an add to list button
function addToList(item) {
    $.jsonApiPost({
        endpoint: '/eco_bundle_organicpizza/cartlines',
        data: { "pizza_id": item },
        success: function(json) {
            refreshCart();
            refreshCartTotal();
        },
        error: function(err) {
            alert("Could not place add to cart");
        }
    });
}

//When clicking on a remove from list button
function removeFromList(line) {
    $.jsonApiDelete({
        endpoint: '/eco_bundle_organicpizza/cartlines/' + line,
        success: function(json) {
            refreshCart();
            refreshCartTotal();
        },
        error: function(err) {
            alert("Could not remove from cart");
        }
    });
}

function refreshCart() {
    $.htmlApiGet({
        endpoint: '/eco_bundle_organicpizza/cartlines-customer',
        success: function(html) {
            $("#cart").html(html);
        },
    });
}

function refreshCartTotal() {
    $.htmlApiGet({
        endpoint: '/eco_bundle_organicpizza/my-cart',
        success: function(html) {
            $("#order").html(html);
        },
    });
}