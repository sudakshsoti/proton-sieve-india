# E-COMMERCE & FOOD DELIVERY (promo split)
# Transactional = Receipts, marketing = Promotions
if address :domain :matches "From" [
    # Shopping
    "*ajio.com",
    "*amazon.com",
    "*amazon.in",
    "*croma.com",
    "*flipkart.com",
    "*jiomart.com",
    "*lenskart.com",
    "*meesho.com",
    "*myntra.com",
    "*nykaa.com",
    "*pepperfry.com",
    "*reliancedigital.in",
    "*snapdeal.com",
    "*tatacliq.com",
    "*tataneu.com",
    # Groceries & quick commerce
    "*bigbasket.com",
    "*blinkit.com",
    "*dunzo.com",
    "*zeptonow.com",
    # Food delivery
    "*dominos.co.in",
    "*eatsure.com",
    "*magicpin.in",
    "*swiggy.in",
    "*zomato.com"
] {
    if exists ["List-Unsubscribe"] {
        fileinto "Promotions";
    } else {
        fileinto "Receipts";
    }
    stop;
}
