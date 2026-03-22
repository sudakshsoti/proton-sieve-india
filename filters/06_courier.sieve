# COURIER & LOGISTICS (always Receipts)
# Tracking updates are always transactional
if address :domain :matches "From" [
    "*aramex.com",
    "*bluedart.com",
    "*delhivery.com",
    "*dhl.com",
    "*dtdc.in",
    "*ecomexpress.in",
    "*ekartlogistics.com",
    "*fedex.com",
    "*gati.com",
    "*indiapost.gov.in",
    "*shiprocket.in",
    "*ups.com",
    "*xpressbees.com"
] {
    fileinto "Receipts";
    stop;
}
