# UTILITIES & TELECOM (promo split, Billing label)
# Airtel/Jio send tons of marketing alongside bills
if address :domain :matches "From" [
    # Electricity
    "*adanielectricity.com",
    "*bsesdelhi.com",
    "*dhbvn.org.in",
    "*msedcl.in",
    "*tatapower.com",
    "*torrentpower.com",
    # Gas
    "*adanigas.com",
    "*igl.co.in",
    "*mahanagargas.com",
    # Telecom & ISP
    "*airtel.in",
    "*bsnl.co.in",
    "*excitel.com",
    "*jio.com",
    "*vodafoneidea.com",
    # Broadband
    "*actcorp.in",
    # DTH
    "*dishtv.in",
    "*tataplay.com"
] {
    if exists ["List-Unsubscribe"] {
        fileinto "Promotions";
    } else {
        fileinto "Receipts";
        fileinto "Billing";
    }
    stop;
}
