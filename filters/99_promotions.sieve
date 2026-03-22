# PROMOTIONS CATCH-ALL
# Anything not matched above but carrying List-Unsubscribe
if exists ["List-Unsubscribe"] {
    fileinto "Promotions";
    stop;
}
