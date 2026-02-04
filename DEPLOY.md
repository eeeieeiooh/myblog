# Deploy (so the agent can push)

Git needs to authenticate to push. Do this **once** so Cursor/the agent can run `./deploy.sh` for you.

## 1. Create a GitHub Personal Access Token

1. Open **https://github.com/settings/tokens**
2. **Generate new token** → **Generate new token (classic)**
3. Name it (e.g. `Blog deploy`), set expiration if you want
4. Check **repo** (full control of private repositories)
5. Generate token → **copy the token** (starts with `ghp_`). You won’t see it again.

## 2. Store the token in this project only

In your Blog folder, create a file named **`.env`** (no other name) with one line:

```bash
GITHUB_TOKEN=ghp_your_token_here
```

Replace `ghp_your_token_here` with your actual token.  
`.env` is in `.gitignore` and must **never** be committed.

## 3. Let the agent (or you) push

- **From Cursor:** Ask the agent to “run deploy” or “push and deploy”; it will run `./deploy.sh`, which uses `GITHUB_TOKEN` from `.env`.
- **From your terminal:**
  ```bash
  ./deploy.sh
  ```

After a push, GitHub Actions builds and deploys to **https://eeeieeiooh.github.io/myblog/** (and you must have **Settings → Pages → Source: GitHub Actions**).

## If you see "Password authentication is not supported"

Git is using a **saved password** instead of the token. Clear it so the script’s token is used:

```bash
# Remove stored GitHub credentials (macOS Keychain or cache)
git credential-osxkeychain erase
```

When prompted, type exactly (then press Enter twice):

```
host=github.com
protocol=https
```

Then run `./deploy.sh` again. It will use the token from `.env`, not your old password.

## Security

- Keep `.env` only on your machine; don’t commit it or share it.
- If the token is ever exposed, revoke it at **https://github.com/settings/tokens** and create a new one.
