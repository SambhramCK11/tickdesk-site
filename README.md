# Tickdesk — project site

A single-page case study for **Tickdesk**, an end-to-end fine-tuned LLM customer
support platform for an online trading broker. Built as a portfolio project for
applied AI engineering roles.

## Files

```
tickdesk-site/
├── index.html    the whole site — self-contained, no build step
├── vercel.json   static host config: clean URLs, cache and security headers
└── README.md     this file
```

Everything except the web fonts is inlined, so the page works offline apart from
typography (it falls back to system faces cleanly).

## Viewing it

Open `index.html` in a browser. That's it.

To serve it locally instead:

```bash
python3 -m http.server 8000
# then open http://localhost:8000
```

## Deploying it

Any static host works — drag the folder onto **Netlify Drop**, push it to a
**GitHub Pages** repo, or deploy to **Vercel**. No framework, no dependencies,
no build.

For Vercel, `vercel.json` is already committed, so there is nothing to
configure. Either import the repo at [vercel.com/new](https://vercel.com/new)
— leave Framework Preset as *Other* and all build/output fields empty — or from
this directory:

```bash
npm i -g vercel
vercel          # preview deployment
vercel --prod   # production
```

The config sets `cleanUrls`, revalidates `/` on every request so edits go live
immediately, and sends `X-Content-Type-Options`, `Referrer-Policy`,
`X-Frame-Options` and a Content-Security-Policy that allows only the Google
Fonts stylesheet and font files (the page ships no scripts).

For GitHub Pages:

```bash
git init && git add . && git commit -m "Tickdesk project site"
git branch -M main
git remote add origin git@github.com:<you>/tickdesk-site.git
git push -u origin main
# then: Settings → Pages → Deploy from branch → main / root
```

## Before you send this to anyone

1. **Add your repository link.** The footer has a placeholder reading
   "add link before sending" — replace that `<a href="#build">` with the real URL
   once the code repo exists.
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
