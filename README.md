# Tickdesk — project site

A single-page case study for **Tickdesk**, an end-to-end fine-tuned LLM customer
support platform for an online trading broker. Built as a portfolio project for
applied AI engineering roles.

## Files

```
tickdesk-site/
├── public/
│   └── index.html    the whole site — self-contained, no build step
├── wrangler.toml     Cloudflare Workers static-asset config
├── package.json      wrangler devDependency + npm scripts
└── README.md         this file
```

Everything except the web fonts is inlined, so the page works offline apart from
typography (it falls back to system faces cleanly).

## Viewing it

Open `public/index.html` in a browser. That's it.

To serve it locally instead:

```bash
npm install
npm run dev        # http://localhost:8787
```

## Deploying it

Deployed to **Cloudflare Workers** static assets — free tier, no credit card.
Static asset requests are unmetered and do not count against the Workers
request allowance, so this site costs nothing to run.

```bash
npm install
npx wrangler login      # one-time browser auth
npm run deploy
```

That publishes to `https://tickdesk-site.<your-subdomain>.workers.dev`.

`wrangler.toml` declares no `main` script — it is an assets-only Worker, which
means there is no server code to invoke and nothing to bill. `not_found_handling`
is set to `single-page-application` so any path serves the one page.

To attach a custom domain later, add it in the Cloudflare dashboard under
Workers & Pages → tickdesk-site → Settings → Domains. Custom domains on
workers.dev are free; only the domain registration itself costs money.

## Before you send this to anyone

1. ~~**Add your repository link.**~~ Done — the footer links to
   <https://github.com/SambhramCK11/tickdesk-site>.
2. **Decide what stays a target.** The hero metrics, dataset counts and eval
   gates are labelled as design targets against a synthetic corpus, and there's a
   visible note saying so. Keep that framing until you've actually run the
   training and evals — then swap the eval table's "Gate" column for a "Result"
   column and delete the targets note. Claiming measured numbers you don't have
   is the fastest way to lose a technical interview.
3. **Check the contact block.** Email and phone are in the footer.

## Editing

The page is plain HTML with a token-based stylesheet at the top of the file.
Colours are defined once on `:root` and redefined for dark mode — change a token,
not a component rule. The section numbering (`01`–`10`) follows the system's
build order, so if you add or remove a section, renumber the `.stage` divs and
the `§` references in the role-fit table.
