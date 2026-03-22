# Proton Sieve India

Curated [Sieve](https://proton.me/support/sieve-advanced-custom-filters) email filters for Proton Mail, optimised for services commonly used in India. Covers 180+ domains across finance, banking, e-commerce, travel, utilities, and more.

## Setup

### 1. Create Folders & Labels in Proton Mail

Before uploading the sieve script, create these in **Proton Mail → Settings → Folders / Labels**.

> Sieve's `fileinto` silently discards mail if the target folder or label does not exist.

**Folders** (create all):

| Folder       | What lands here                                     |
|------------- |-----------------------------------------------------|
| Finance      | Investment alerts, insurance, tax, MF statements    |
| Accounts     | Bank alerts, OTPs, payment confirmations, identity  |
| Receipts     | Order confirmations, tracking, bills, lab reports    |
| Promotions   | Marketing emails (via List-Unsubscribe detection)   |
| Newsletters  | Subscribed newsletter senders                       |
| Saved        | Manual saves (not auto-filtered)                    |

**Labels** (create these):

| Label        | Applied alongside folder                            |
|------------- |-----------------------------------------------------|
| Travel       | Booking confirmations, boarding passes, cab rides    |
| Billing      | Utility bills, telecom bills                        |
| Actionable   | (Manual — tag emails you need to act on)            |
| Alias        | (Manual — tag emails sent to alias addresses)       |

### 2. Upload the Filter

```bash
./build.sh
```

Then paste the contents of `combined.sieve` into:
**Proton Mail → Settings → Filters → Sieve editor**

Alternatively, copy `combined.sieve` directly from this repo — it is kept up-to-date via GitHub Actions.

## Structure

```
filters/
├── 00_spam.sieve           # Proton spam threshold check
├── 01_finance.sieve        # Investments, brokers, insurance, tax
├── 02_accounts.sieve       # Banks, cards, payment gateways, identity
├── 03_wallets.sieve        # Paytm, PhonePe, CRED, MobiKwik (promo split)
├── 04_travel.sieve         # Airlines, OTAs, rail, cabs, hotels (promo split)
├── 05_ecommerce.sieve      # Amazon, Flipkart, Swiggy, Meesho (promo split)
├── 06_courier.sieve        # BlueDart, Delhivery, DTDC, FedEx (always Receipts)
├── 07_health.sieve         # Pharmacies, hospitals, labs, fitness (promo split)
├── 08_utilities.sieve      # Electricity, gas, telecom, DTH (promo split)
├── 09_government.sieve     # .gov.in / .nic.in catch-all
├── 10_newsletters.sieve    # Newsletter platforms (Substack, Beehiiv, etc.)
├── 11_entertainment.sieve  # OTT & streaming (Netflix, Hotstar, Spotify)
├── 12_education.sieve      # Online learning (Coursera, Udemy, upGrad)
├── 13_jobs.sieve           # Job portals (Naukri, Indeed, Internshala)
└── 99_promotions.sieve     # Catch-all for List-Unsubscribe
```

## How It Works

### Processing Order

Proton Mail runs rules in the order they appear in the sieve script. The `build.sh` script concatenates all numbered filter files into one `combined.sieve`. Each rule uses `stop` to prevent further processing once matched.

### Domain Matching

Uses `address :domain :matches "From"` with wildcard patterns (`*domain.com`) to match subdomains (e.g., `alerts.icicibank.com`).

### Promo Split

The key design pattern for "mixed" senders (e-commerce, travel, utilities, etc.):

- **`List-Unsubscribe` header present** → Marketing email → **Promotions**
- **`List-Unsubscribe` header absent** → Transactional email → **Receipts** (or category folder)

High-trust senders (Finance, Accounts, Courier) skip this check entirely — all their emails go directly to their folder.

### Wildcards

- `*.bank.in` — Catches all RBI-regulated banks using the `.bank.in` TLD
- `*.gov.in` / `*.nic.in` — Government catch-all (routes to Accounts)

## Customisation

### Adding Your State Electricity Board

The `08_utilities.sieve` file includes major providers. Add your state's board:

```sieve
    "*bescom.karnataka.gov.in",   # Karnataka
    "*tnebnet.org",               # Tamil Nadu
    "*wbsedcl.in",                # West Bengal
```

> State electricity boards using `.gov.in` domains are already caught by `09_government.sieve`.

### Adding Personal Newsletters

Edit `10_newsletters.sieve` and add your subscribed domains:

```sieve
    "*finshots.in",
    "*the-ken.com",
    "*morningcontext.com"
```

### Adding Other Domains

1. Identify which category the sender belongs to.
2. Open the corresponding `filters/XX_category.sieve` file.
3. Add the domain (use `*domain.com` format for wildcard subdomain matching).
4. Run `./build.sh` and paste the output into Proton's sieve editor.

### Updating After Domain Changes

When a sender changes domains (e.g., Axis Bank moved alerts from `axisbank.com` to `axis.bank.in`), add the new domain alongside the old one. Don't remove old domains immediately — some automated emails may still come from legacy addresses.

## Contributing

Contributions are welcome. When submitting a PR:

1. Add domains to the correct category file in alphabetical order within their comment group.
2. Use `*domain.com` format (wildcard prefix for subdomain matching).
3. Ensure the domain is not already listed in another category file.
4. Run `./build.sh` to verify the combined output.
5. Briefly note what the service is if it's not widely known.

### What to contribute

- Missing major Indian services (banks, insurers, e-commerce, etc.)
- Regional utility providers with a comment noting the region
- Corrections to misplaced domains

### What NOT to contribute

- Personal newsletter subscriptions (add those locally)
- Niche/local businesses with very small user bases
- International services without significant Indian usage

## License

MIT
