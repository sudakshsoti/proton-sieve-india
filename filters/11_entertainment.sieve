# ENTERTAINMENT & STREAMING (promo split)
# Transactional = Receipts (billing, password resets), marketing = Promotions
if address :domain :matches "From" [
    "*hotstar.com",
    "*jiocinema.com",
    "*netflix.com",
    "*primevideo.com",
    "*sonyliv.com",
    "*spotify.com",
    "*wynk.in",
    "*youtube.com",
    "*zee5.com"
] {
    if exists ["List-Unsubscribe"] {
        fileinto "Promotions";
    } else {
        fileinto "Receipts";
    }
    stop;
}
