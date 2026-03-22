# TRAVEL (promo split, Travel label applied)
# Airlines, rail, cabs, OTAs, hotels, buses, FASTag
if address :domain :matches "From" [
    # Airlines
    "*airindia.com",
    "*airindiaexpress.com",
    "*akasaair.com",
    "*goindigo.in",
    "*spicejet.com",
    "*vistara.com",
    # Railways
    "*confirmtkt.com",
    "*irctc.co.in",
    # OTAs (online travel agencies)
    "*cleartrip.com",
    "*easemytrip.com",
    "*goibibo.com",
    "*ixigo.com",
    "*makemytrip.com",
    "*yatra.com",
    # Hotels
    "*oyorooms.com",
    # Buses
    "*redbus.in",
    # Cabs
    "*blusmartindia.com",
    "*olacabs.com",
    "*rapido.bike",
    "*uber.com",
    # FASTag
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
