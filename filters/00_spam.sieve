# SPAM CHECK
# If Proton marks this as spam, stop immediately.
if allof (
    environment :matches "vnd.proton.spam-threshold" "*",
    spamtest :value "ge" :comparator "i;ascii-numeric" "${1}"
) {
    stop;
}
