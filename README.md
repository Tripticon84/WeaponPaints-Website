# WeaponPaints Website (mirror + Docker image)

This repo is an **automatic mirror** of the `website/` folder of Nereziel's
[cs2-WeaponPaints](https://github.com/Nereziel/cs2-WeaponPaints) plugin,
packaged as a ready-to-use Docker image published on the GitHub Container
Registry (GHCR).

The sources here come from the `WeaponPaints-Website.zip` asset of the latest
upstream release (see the `.upstream-release` file).

## Automation

The workflow [`.github/workflows/update.yml`](.github/workflows/update.yml):

1. checks the latest upstream release every **Monday at 08:00 UTC** (cron);
2. downloads and syncs `WeaponPaints-Website.zip` when the tag changed;
3. builds and pushes the Docker image to GHCR;
4. commits the updated sources.

Files owned by this repo are never overwritten by the sync:

- **`class/config.php`** — customized locally: the upstream version hardcodes the
  values (`define('DB_HOST', 'localhost')`, ...); it was replaced with a version
  reading environment variables (`getenv()`), fed by the `.env` file through
  `docker compose`. The workflow warns when upstream adds a new setting
  (shown in the *job summary*).
- `Dockerfile`, `docker-compose*.yml`, `.github/`, `.dockerignore`, `.env*`, `README.md`

### Manual run

**Actions** tab → *Sync upstream & build Docker image* → **Run workflow**
(`force` option to rebuild even when already up to date).

### No secrets required

The workflow authenticates to GHCR with the built-in `GITHUB_TOKEN`
(`packages: write` permission), so there is nothing to configure.

## Published images

- `ghcr.io/tripticon84/weaponpaints-website:latest` — latest release
- `ghcr.io/tripticon84/weaponpaints-website:build-XXX` — pinned version

> The package is **private** by default on its first push. To allow anonymous
> pulls, open your GitHub profile → **Packages** → `weaponpaints-website` →
> *Package settings* → *Change visibility* → **Public**.

## Usage

```bash
cp .env.example .env   # then set STEAM_API_KEY
docker compose up -d
```

The Steam API key (and any other secret) is configured in the **`.env`** file,
which is git-ignored. See `docker-compose.yml` for the rest of the configuration
(MySQL database + environment variables: `DB_*`, `SKIN_LANGUAGE`,
`WEB_STYLE_DARK`, ...).

## Setup note

For the workflow to be able to push the image and commit the synced sources,
`Settings → Actions → General → Workflow permissions` must be set to
**Read and write permissions**.
