# ACCOUNTS (always route, never treat as promo)
# Banks, cards, payment gateways, identity services
if address :domain :matches "From" [
    # Banks (legacy .com/.co.in domains)
    "*aubank.in",
    "*axisbank.com",
    "*bandhanbank.com",
    "*bankofbaroda.in",
    "*canarabank.com",
    "*federalbank.co.in",
    "*hdfcbank.com",
    "*hdfcbank.net",
    "*icicibank.com",
    "*idfcfirstbank.com",
    "*indusind.com",
    "*kotak.com",
    "*pnbindia.in",
    "*sbi.co.in",
    "*yesbank.in",
    # Banks (RBI-mandated .bank.in — catches all regulated banks)
    "*.bank.in",
    # SBI branded TLD
    "*.sbi",
    # Cards
    "*americanexpress.com",
    "*aexp.com",
    # Payment gateways (transactional confirmations)
    "*billdesk.com",
    "*cashfree.com",
    "*ccavenue.com",
    "*instamojo.com",
    "*juspay.in",
    "*payu.in",
    "*razorpay.com",
    # Neo-banks & fintechs
    "*fi.money",
    "*jupiter.money",
    "*niyo.co",
    # Identity & government accounts
    "*digilocker.gov.in",
    "*parivahan.gov.in",
    "*passportindia.gov.in",
    "*uidai.gov.in",
    # UPI backend
    "*npci.org.in"
] {
    fileinto "Accounts";
    stop;
}
