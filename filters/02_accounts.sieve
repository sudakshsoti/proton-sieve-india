# ACCOUNTS (always route, never treat as promo)
# Banks, cards, payment gateways, identity services
if address :domain :matches "From" [
    # Banks (legacy .com/.co.in domains)
    "*icicibank.com",
    "*axisbank.com",
    "*hdfcbank.com",
    "*hdfcbank.net",
    "*sbi.co.in",
    "*kotak.com",
    "*idfcfirstbank.com",
    # Banks (RBI-mandated .bank.in — catches all regulated banks)
    "*.bank.in",
    # SBI branded TLD
    "*.sbi",
    # Cards
    "*americanexpress.com",
    "*aexp.com",
    # Payment gateways (transactional confirmations)
    "*razorpay.com",
    "*billdesk.com",
    "*payu.in",
    "*ccavenue.com",
    # Identity & government accounts
    "*uidai.gov.in",
    "*passportindia.gov.in",
    "*digilocker.gov.in",
    "*parivahan.gov.in",
    # UPI backend
    "*npci.org.in",
    # Health accounts (always route, low promo volume)
    "*1mg.com",
    "*tata1mg.com"
] {
    fileinto "Accounts";
    stop;
}
