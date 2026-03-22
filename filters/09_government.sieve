# GOVERNMENT CATCH-ALL
# Anything from .gov.in or .nic.in not caught above
if address :domain :matches "From" ["*.gov.in", "*.nic.in"] {
    fileinto "Accounts";
    stop;
}
