# HEALTH & DIAGNOSTICS (promo split)
if address :domain :matches "From" [
    "*pharmeasy.in",
    "*apollo247.com",
    "*practo.com",
    "*lalpathlabs.com",
    "*thyrocare.com",
    "*srlworld.com"
] {
    if exists ["List-Unsubscribe"] {
        fileinto "Promotions";
    } else {
        fileinto "Receipts";
    }
    stop;
}
