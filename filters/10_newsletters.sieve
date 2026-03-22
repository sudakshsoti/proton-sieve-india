# NEWSLETTERS (known newsletter platforms)
# These platforms are used exclusively for newsletters.
# Add your personal newsletter domains below the platform list.
if address :domain :matches "From" [
    "*beehiiv.com",
    "*buttondown.email",
    "*convertkit.com",
    "*ghost.io",
    "*substack.com"
    # ── Add your subscribed newsletter domains below ──
    # "*finshots.in",
    # "*the-ken.com",
    # "*morningcontext.com"
] {
    fileinto "Newsletters";
    stop;
}
