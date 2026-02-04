# 🚀 Quick Start Guide

## Step 1: Install Hugo (5 minutes)

### Mac
Open Terminal and run:
```bash
brew install hugo
```

### Windows
Open PowerShell as Administrator and run:
```bash
choco install hugo-extended
```
(If you don't have Chocolatey, install it from: https://chocolatey.org/install)

### Linux
```bash
sudo snap install hugo
```

**Or download directly:** https://github.com/gohugoio/hugo/releases

---

## Step 2: Test Your Blog Locally (1 minute)

1. Open Terminal/PowerShell
2. Navigate to your blog folder:
   ```bash
   cd path/to/blog
   ```
3. Run Hugo:
   ```bash
   hugo server
   ```
4. Open http://localhost:1313 in your browser
5. You should see your blog! 🎉

---

## Step 3: Write Your First Post (5 minutes)

### Option A: Use Hugo command
```bash
hugo new content/posts/my-first-post.md
```

### Option B: Create file manually
Create `content/posts/my-first-post.md` with:

```markdown
---
title: "My First Post"
date: 2025-02-03
draft: false
weight: 6
---

This is my first post!

## It's super easy

Just write in **Markdown** and Hugo handles the rest.
```

Save and check http://localhost:1313 - it updates automatically!

---

## Step 4: Customize Your Blog (10 minutes)

### Update site info
Edit `hugo.toml`:
```toml
title = "Jane Doe"  # Your name
baseURL = "https://janedoe.github.io/"  # Your URL

[params]
  description = "I write about design and coffee."  # Your bio
  author = "Jane Doe"
```

### Change email
Edit `layouts/index.html` - find this line:
```html
<a href="mailto:you@example.com">Email</a>
```
Change to your email.

---

## Step 5: Deploy to GitHub Pages (15 minutes)

### 5.1 Create GitHub repository
1. Go to https://github.com/new
2. Name it: `yourusername.github.io` (use your actual GitHub username!)
3. Make it public
4. Don't add README/gitignore (we already have them)

### 5.2 Push your blog
In Terminal, inside your blog folder:
```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/yourusername/yourusername.github.io.git
git push -u origin main
```

### 5.3 Enable GitHub Pages
1. Go to your repo → Settings → Pages
2. Source: **GitHub Actions**
3. Wait 2-3 minutes

Your blog will be live at: `https://yourusername.github.io` 🎉

---

## Daily Workflow

### Writing a new post
```bash
hugo new content/posts/post-name.md
```

### Preview locally
```bash
hugo server
```

### Publish
```bash
git add .
git commit -m "New post"
git push
```

GitHub automatically rebuilds and deploys!

---

## Common Questions

**Q: How do I change colors/fonts?**
A: Edit `layouts/_default/baseof.html` - all CSS is in the `<style>` section

**Q: Posts aren't showing up?**
A: Check that `draft: false` in the post's front matter

**Q: How do I add images?**
A: Put images in `static/images/`, then use: `![alt text](/images/photo.jpg)`

**Q: Can I use a custom domain?**
A: Yes! Add a `CNAME` file to `/static/` with your domain, then configure DNS

**Q: Something broke?**
A: Run `hugo server -D` to see errors. Check Hugo docs: https://gohugo.io/

---

## Next Steps

- ✅ Write 5-10 posts to fill out your blog
- ✅ Share with friends
- ✅ Customize the design to make it yours
- ✅ Set up a custom domain (optional)

**You're all set! Happy blogging! 📝**
