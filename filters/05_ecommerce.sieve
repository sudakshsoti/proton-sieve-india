# E-COMMERCE & FOOD DELIVERY (promo split)
# Transactional = Receipts, marketing = Promotions
if address :domain :matches "From" [
    "*amazon.in",
    "*amazon.com",
    "*flipkart.com",
    "*myntra.com",
    "*ajio.com",
    "*tataneu.com",
    "*blinkit.com",
    "*bigbasket.com",
    "*zeptonow.com",
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
