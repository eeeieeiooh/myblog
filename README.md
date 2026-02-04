# Your Hugo Blog

A minimal, clean blog inspired by William Jansson's design. Write in Markdown, deploy anywhere.

## Quick Start

### 1. Install Hugo

**Mac:**
```bash
brew install hugo
```

**Windows:**
```bash
choco install hugo-extended
```

**Linux:**
```bash
sudo apt-get install hugo
# or
sudo snap install hugo
```

Or download from: https://github.com/gohugoio/hugo/releases

### 2. Run locally

```bash
cd blog
hugo server -D
```

Visit `http://localhost:1313` in your browser.

### 3. Create a new post

```bash
hugo new content/posts/my-new-post.md
```

This creates a new Markdown file in `content/posts/`. Edit it with any text editor.

## Writing Posts

Posts are just Markdown files in `content/posts/`. Here's the structure:

```markdown
---
title: "Your Post Title"
date: 2025-01-30
draft: false
weight: 6
---

Your content here in **Markdown**.

## Subheadings work

- Lists work
- Images work
- Everything you'd expect
```

**Important:** Increment the `weight` number for each new post to maintain proper numbering.

## File Structure

```
blog/
├── content/
│   ├── posts/          # Your blog posts (.md files)
│   └── about.md        # About page
├── layouts/            # HTML templates
├── static/             # Images, CSS, JS (if needed)
├── hugo.toml           # Site configuration
└── README.md           # This file
```

## Customization

### Change site title and description
Edit `hugo.toml`:

```toml
title = "Your Actual Name"

[params]
  description = "Your actual bio here"
```

### Change colors or fonts
Edit `layouts/_default/baseof.html` - all CSS is in the `<style>` tag.

## Deployment Options

### GitHub Pages (Free)

1. Create a repo called `yourusername.github.io`
2. Push your blog folder
3. Add `.github/workflows/hugo.yml`:

```yaml
name: Deploy Hugo site to Pages

on:
  push:
    branches: ["main"]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: 'latest'
          extended: true
      - name: Build
        run: hugo --minify
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v2
        with:
          path: ./public

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v2
```

4. Enable GitHub Pages in repo Settings → Pages → Source: GitHub Actions

### Netlify (Free)

1. Push to GitHub
2. Go to netlify.com
3. "New site from Git"
4. Select your repo
5. Build command: `hugo --minify`
6. Publish directory: `public`
7. Done!

### Build for any host

```bash
hugo --minify
```

Upload the `public/` folder to any web server.

## Tips

- Keep posts in Markdown - it's simple and portable
- Use the `weight` field to control post numbering
- Set `draft: true` to hide posts while working on them
- Run `hugo server -D` to see drafts locally

## Need Help?

- Hugo docs: https://gohugo.io/documentation/
- Markdown guide: https://www.markdownguide.org/

Enjoy your new blog! 🎉
