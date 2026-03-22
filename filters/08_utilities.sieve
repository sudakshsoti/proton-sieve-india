# UTILITIES & TELECOM (promo split, Billing label)
# Airtel/Jio send tons of marketing alongside bills
if address :domain :matches "From" [
    "*dhbvn.org.in",
    "*igl.co.in",
    "*airtel.in",
    "*jio.com",
    "*vodafoneidea.com",
    "*actcorp.in"
] {
    if exists ["List-Unsubscribe"] {
        fileinto "Promotions";
    } else {
        fileinto "Receipts";
        fileinto "Billing";
    }
    stop;
}
