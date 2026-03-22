# TRAVEL (promo split, Travel label applied)
# Airlines, rail, cabs, FASTag
if address :domain :matches "From" [
    "*irctc.co.in",
    "*goindigo.in",
    "*airindia.com",
    "*vistara.com",
    "*uber.com",
    "*olacabs.com",
    "*blusmartindia.com",
    "*ihmcl.com"
] {
    if exists ["List-Unsubscribe"] {
        fileinto "Promotions";
    } else {
        fileinto "Receipts";
        fileinto "Travel";
    }
    stop;
}
