# EDUCATION & LEARNING (promo split)
# Transactional = Receipts (enrollment, certificates), marketing = Promotions
if address :domain :matches "From" [
    "*byjus.com",
    "*codingninjas.com",
    "*coursera.org",
    "*edx.org",
    "*khanacademy.org",
    "*scaler.com",
    "*skillshare.com",
    "*udemy.com",
    "*unacademy.com",
    "*upgrad.com"
] {
    if exists ["List-Unsubscribe"] {
        fileinto "Promotions";
    } else {
        fileinto "Receipts";
    }
    stop;
}
