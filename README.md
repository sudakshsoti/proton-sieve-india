# Proton Mail Sieve Filters

Personal sieve filters for Proton Mail, organised by category for easy maintenance.

## Structure

```
filters/
├── 00_spam.sieve           # Proton spam threshold check
├── 01_finance.sieve        # Investments, brokers, insurance, tax
├── 02_accounts.sieve       # Banks, cards, payment gateways, identity
├── 03_wallets.sieve        # Paytm, PhonePe, CRED (promo split)
├── 04_travel.sieve         # Airlines, rail, cabs, FASTag (promo split)
├── 05_ecommerce.sieve      # Amazon, Flipkart, Swiggy, etc. (promo split)
├── 06_courier.sieve        # BlueDart, Delhivery, FedEx (always Receipts)
├── 07_health.sieve         # Pharmeasy, Practo, labs (promo split)
├── 08_utilities.sieve      # Electricity, gas, telecom (promo split)
├── 09_government.sieve     # .gov.in / .nic.in catch-all
├── 10_newsletters.sieve    # Known newsletter senders
└── 99_promotions.sieve     # Catch-all for List-Unsubscribe
```

## Folder & Label Mapping

| Folder       | What lands here                                    |
|------------- |----------------------------------------------------|
| Finance      | Investment alerts, insurance, tax, MF statements   |
| Accounts     | Bank alerts, OTPs, payment confirmations, identity |
| Receipts     | Order confirmations, tracking, bills, lab reports   |
| Promotions   | Marketing emails (via List-Unsubscribe detection)  |
| Newsletters  | Subscribed newsletter senders                      |
| Saved        | Manual saves                                       |

| Label        | Applied alongside folder                           |
|------------- |----------------------------------------------------|
| Travel       | Booking confirmations, boarding passes, cab rides   |
| Billing      | Utility bills, telecom bills                       |
| Actionable   | (Manual)                                           |
| Alias        | (Manual)                                           |

## How It Works

Proton Mail accepts a single sieve script. The `build.sh` script concatenates all
numbered filter files into one `combined.sieve` ready for upload.

```bash
./build.sh
```

Then paste the contents of `combined.sieve` into:
**Proton Mail → Settings → Filters → Sieve editor**

## Design Principles

1. **Whitelisted domains skip the promo filter entirely.** Finance and Accounts
   sections use `stop` immediately — no `List-Unsubscribe` check. These are
   high-trust senders where even marketing-adjacent emails (membership reminders,
   fee changes) should not be filtered.

2. **Promo split for mixed senders.** E-commerce, health, travel, utilities, and
   wallets check for `List-Unsubscribe`. Transactional emails (order confirmations,
   lab reports, boarding passes) rarely carry this header. Marketing emails almost
   always do.

3. **Labels applied alongside folders.** Travel and Billing labels are added to
   Receipts so you can filter within the folder. Sieve's `fileinto` applies labels
   when the target is a Proton label rather than a folder.

4. **Catch-all at the bottom.** Anything not matched by a specific rule but carrying
   `List-Unsubscribe` goes to Promotions. Everything else stays in Inbox.

5. **`.bank.in` wildcard.** RBI mandated all Indian banks to migrate to `.bank.in`
   by Oct 2025. A single wildcard future-proofs the script for any bank.

## Adding a New Sender

1. Identify which category the sender belongs to.
2. Open the corresponding `filters/XX_category.sieve` file.
3. Add the domain (use `*domain.com` format for wildcard subdomain matching).
4. Run `./build.sh` and paste the output into Proton's sieve editor.
5. Commit and push.

## Updating After Domain Changes

When a sender changes domains (e.g., Axis Bank moved alerts from `axisbank.com` to
`axis.bank.in`), add the new domain alongside the old one. Don't remove old domains
immediately — some automated emails may still come from legacy addresses during
transition periods.
