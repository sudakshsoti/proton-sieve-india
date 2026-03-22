# WALLETS & REWARDS (promo split)
# These send heavy marketing alongside transaction alerts
if address :domain :matches "From" [
    "*cred.club",
    "*freecharge.com",
    "*lazypay.in",
    "*mobikwik.com",
    "*paytm.com",
    "*phonepe.com",
    "*simpl.one"
] {
    if exists ["List-Unsubscribe"] {
        fileinto "Promotions";
    } else {
        fileinto "Accounts";
    }
    stop;
}
