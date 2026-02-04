# Custom domain (Squarespace → GitHub Pages)

**Domain:** devonhwilson.com  
**GitHub site:** https://eeeieeiooh.github.io/myblog

## 1. Add the domain in GitHub

1. Repo **Settings** → **Pages**
2. Under **Custom domain**, enter: **devonhwilson.com**
3. Save. GitHub may show a **Verify** button and/or ask for a TXT record — add that in Squarespace if prompted.

## 2. Point DNS in Squarespace

In **Squarespace**: **Settings** → **Domains** → devonhwilson.com → **DNS Settings** (or **Advanced** → **DNS**).

### Option A: Root domain (devonhwilson.com)

| Type | Host | Value / Points to |
|------|------|-------------------|
| **A** | `@` | `185.199.108.153` |
| **A** | `@` | `185.199.109.153` |
| **A** | `@` | `185.199.110.153` |
| **A** | `@` | `185.199.111.153` |

So: **four A records**, host `@` (or leave blank if Squarespace uses “root”), each with one of the IPs above.

### Option B: www (www.devonhwilson.com)

| Type | Host | Value / Points to |
|------|------|-------------------|
| **CNAME** | `www` | `eeeieeiooh.github.io` |

Only one CNAME. Do **not** use `eeeieeiooh.github.io/myblog` — use `eeeieeiooh.github.io` only.

### Option C: Both root and www

Add all four **A** records (as in Option A) and the **CNAME** for `www` (as in Option B). Then in GitHub Pages settings you can choose whether the custom domain is the apex or www; GitHub will redirect the other.

## 3. Wait and verify

- DNS can take from a few minutes up to 24–48 hours.
- In GitHub **Settings → Pages**, when the domain is verified you’ll see a green check.
- If GitHub asked for a **TXT** record for verification, add that in Squarespace and save, then click **Verify** again in GitHub.

## 4. HTTPS (recommended)

After the domain is verified, in GitHub Pages settings turn on **Enforce HTTPS** so your site is served over HTTPS.

## If "DNS check unsuccessful" appears

- **Verify again** — Wait a few minutes and click Verify (or remove the domain, save, then re-add it).
- **Try www first** — Set custom domain to **www.devonhwilson.com**; if that verifies, you can switch to devonhwilson.com later.
- **Add GitHub’s TXT record** — If GitHub shows a TXT record for verification, add it in Squarespace DNS, then Verify again.
- **No extra A/CNAME for @** — In Squarespace, delete any other A or CNAME for the root (@) that point to Squarespace or non-GitHub IPs; only the four GitHub A records should remain for @.
- **Propagation** — GitHub’s servers may see DNS later; wait 15–30 minutes and retry.

---

**Reference:** [GitHub: Configuring a custom domain for GitHub Pages](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site)
