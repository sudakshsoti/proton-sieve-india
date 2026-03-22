# FINANCE (always route, never treat as promo)
# Investments, brokers, depositories, insurance, tax
if address :domain :matches "From" [
    # Brokers & investment platforms
    "*5paisa.com",
    "*angelone.in",
    "*groww.in",
    "*hdfcsecurities.com",
    "*icicidirect.com",
    "*indmoney.com",
    "*kotaksecurities.com",
    "*kuvera.in",
    "*motilaloswal.com",
    "*sharekhan.com",
    "*smallcase.com",
    "*upstox.com",
    "*zerodha.com",
    "*zerodha.net",
    # MF platforms & registrars
    "*camsonline.com",
    "*etmoney.com",
    "*kfintech.com",
    "*mfcentral.com",
    "*paytmmoney.com",
    # Depositories & exchanges
    "*bseindia.com",
    "*cdslindia.co.in",
    "*nsdl.co.in",
    "*nse.co.in",
    "*nseindia.com",
    # Insurance
    "*acko.com",
    "*bajajallianz.com",
    "*bajajfinserv.in",
    "*careinsurance.com",
    "*godigit.com",
    "*hdfcergo.com",
    "*hdfclife.com",
    "*icicilombard.com",
    "*iciciprulife.com",
    "*joinditto.in",
    "*licindia.in",
    "*maxlifeinsurance.com",
    "*newindia.co.in",
    "*nivabupa.com",
    "*policybazaar.com",
    "*sbilife.com",
    "*starhealth.in",
    "*tataaig.com",
    # Tax & provident fund
    "*cpc.gov.in",
    "*epfindia.gov.in",
    "*gst.gov.in",
    "*gstn.org.in",
    "*incometax.gov.in",
    "*traces.gov.in",
    # Credit bureaus
    "*cibil.com",
    "*experian.in"
] {
    fileinto "Finance";
    stop;
}
