# WALLETS & REWARDS (promo split)
# These send heavy marketing alongside transaction alerts
if address :domain :matches "From" [
    "*paytm.com",
    "*phonepe.com",
    "*cred.club"
] {
    if exists ["List-Unsubscribe"] {
        fileinto "Promotions";
    } else {
        fileinto "Accounts";
    }
    stop;
}
