# HEALTH & DIAGNOSTICS (promo split)
if address :domain :matches "From" [
    # Pharmacies
    "*1mg.com",
    "*netmeds.com",
    "*pharmeasy.in",
    "*tata1mg.com",
    # Hospitals
    "*apollo.in",
    "*apollo247.com",
    "*fortishealthcare.com",
    "*manipalhospitals.com",
    "*maxhealthcare.com",
    "*narayanhealth.org",
    # Diagnostics & labs
    "*lalpathlabs.com",
    "*metropolisindia.com",
    "*srlworld.com",
    "*thyrocare.com",
    # Consultations
    "*practo.com",
    # Fitness & wellness
    "*cultfit.in",
    "*healthifyme.com"
] {
    if exists ["List-Unsubscribe"] {
        fileinto "Promotions";
    } else {
        fileinto "Receipts";
    }
    stop;
}
