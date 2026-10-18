# Homebrew Tap

Homebrew formulas and casks for my projects.

## Install

```bash
brew tap franzos/tap
```

Then install what you need:

```bash
brew install tku
brew install envstash
brew install jota
brew install --cask jota-gui
brew install shelf
brew install vatic
```

## What's in here

| Name | Type | Description |
|------|------|-------------|
| [tku](https://github.com/franzos/tku) | Formula | Token usage CLI for Claude Code, Codex and others |
| [envstash](https://github.com/franzos/envstash) | Formula | Manage .env files across git branches with versioning, diffing, and optional encryption |
| [jota](https://github.com/franzos/jota) | Formula | Monero-inspired wallet for IOTA Rebased |
| [jota-gui](https://github.com/franzos/jota) | Cask | Desktop app for Jota |
| [shelf](https://github.com/franzos/shelf) | Formula | Catalogue files by metadata-driven rules |
| [vatic](https://github.com/franzos/vatic) | Formula | TOML-configured AI agent framework with scheduled jobs and channel integrations |

## Updates

Formulas are updated automatically via GitHub Actions. The workflow checks each upstream repo daily for new releases and updates version + hashes when found.

To run manually:

```bash
bash scripts/update-formulas.sh
```
