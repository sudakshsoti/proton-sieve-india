# JOBS & RECRUITMENT (promo split)
# Transactional = Receipts (application updates, interview invites), marketing = Promotions
# Note: LinkedIn excluded — linkedin.com is too broad (social, learning, jobs, marketing)
if address :domain :matches "From" [
    "*apna.co",
    "*foundit.in",
    "*hirist.com",
    "*indeed.com",
    "*instahyre.com",
    "*internshala.com",
    "*naukri.com",
    "*wellfound.com"
] {
    if exists ["List-Unsubscribe"] {
        fileinto "Promotions";
    } else {
        fileinto "Receipts";
    }
    stop;
}
