# FINANCE (always route, never treat as promo)
# Investments, brokers, depositories, insurance, tax
if address :domain :matches "From" [
    # Brokers & investment platforms
    "*zerodha.com",
    "*zerodha.net",
    "*upstox.com",
    "*groww.in",
    "*indmoney.com",
    "*kuvera.in",
    "*smallcase.com",
    # Depositories & exchanges
    "*cdslindia.co.in",
    "*nsdl.co.in",
    "*bseindia.com",
    "*nseindia.com",
    "*nse.co.in",
    # MF registrars
    "*camsonline.com",
    "*kfintech.com",
    # Insurance
    "*policybazaar.com",
    "*joinditto.in",
    "*licindia.in",
    "*maxlifeinsurance.com",
    "*hdfclife.com",
    "*starhealth.in",
    "*nivabupa.com",
    "*acko.com",
    "*godigit.com",
    "*icicilombard.com",
    # Tax & provident fund
    "*incometax.gov.in",
    "*cpc.gov.in",
    "*epfindia.gov.in"
] {
    fileinto "Finance";
    stop;
}
