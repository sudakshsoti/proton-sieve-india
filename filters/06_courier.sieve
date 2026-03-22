# COURIER & LOGISTICS (always Receipts)
# Tracking updates are always transactional
if address :domain :matches "From" [
    "*bluedart.com",
    "*delhivery.com",
    "*dhl.com",
    "*fedex.com",
    "*indiapost.gov.in",
    "*shiprocket.in"
] {
    fileinto "Receipts";
    stop;
}
