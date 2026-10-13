# Calveris for Recruitment Firms (USA)

Static, single-page site. The entire site lives in `index.html`; there is no build step.

## Hosting on GitHub Pages with a custom domain

1. **Settings → Pages**: set Source to "Deploy from a branch", pick the branch and `/ (root)`.
2. **Custom domain**: enter your domain (e.g. `recruitment.example.com`) and save. GitHub adds a `CNAME` file to the branch.
3. **DNS** at your registrar:
   - Subdomain: `CNAME` record → `<github-username>.github.io`
   - Apex domain: `A` records → `185.199.108.153`, `185.199.109.153`, `185.199.110.153`, `185.199.111.153`
4. Once the certificate is issued, tick **Enforce HTTPS**.
