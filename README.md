# Calveris Connect

Private links to Calveris pitch decks and client resources, all on one subdomain.
Each resource lives in its own folder with a random suffix, e.g.
`https://recruitus.calverisglobal.com/recruit-us-6mljgb3j09/`.
The root page redirects to calverisglobal.com, so nobody can browse the list.

**Keep this repository private.** The random suffix is the only thing keeping one
client away from another client's link.

## Add a resource

```sh
./new-resource.sh acme-proposal ~/Downloads/acme.html
git add . && git commit -m "Add Acme proposal" && git push
```

The script prints the link to send. To revoke a link, delete or rename the folder.

## Hosting (free): Cloudflare Pages

GitHub Pages only serves private repos on paid plans, so this repo is hosted on
Cloudflare Pages instead.

1. GitHub → Settings → General → Danger Zone → **Change visibility → Private**.
2. Cloudflare dashboard → Workers & Pages → Create → Pages → **Connect to Git**,
   pick this repo and the production branch. Framework preset: *None*,
   build command: empty, output directory: `/`.
3. In the project → **Custom domains** → add the subdomain
   (e.g. `recruitus.calverisglobal.com`).
4. At your DNS provider, point the subdomain's `CNAME` record to
   `<project>.pages.dev` (replacing the old `<user>.github.io` record).
5. GitHub → Settings → Pages → **Unpublish** the old GitHub Pages site.

`_headers` tells Cloudflare to send no-index and no-referrer headers so links
don't leak to search engines or to other sites.
