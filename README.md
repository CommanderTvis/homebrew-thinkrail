# Homebrew tap for ThinkRail and SharpRail builds

Install macOS (Apple Silicon) builds through one Homebrew tap. Packages are grouped below.

| Package | Author | Id | Architectures |
| --- | --- | --- | --- |
| [ThinkRail CLI (fork nightly)](https://github.com/CommanderTvis/thinkrail) | [CommanderTvis](https://github.com/CommanderTvis) | `thinkrail` (formula) | ARM64 |
| [ThinkRail Desktop (fork nightly)](https://github.com/CommanderTvis/thinkrail) | [CommanderTvis](https://github.com/CommanderTvis) | `thinkrail-desktop` (cask) | ARM64 |
| [SharpRail (nightly)](https://github.com/CommanderTvis/sharprail) | [CommanderTvis](https://github.com/CommanderTvis) | `sharprail` (cask) | ARM64 |

## Add the tap

Use Homebrew 7 or later. Trust and add the tap once:

```sh
brew trust --tap commandertvis/thinkrail   # Homebrew 7+ refuses untrusted taps
brew tap commandertvis/thinkrail
```

## ThinkRail fork nightly

Nightly builds of the [CommanderTvis ThinkRail fork](https://github.com/CommanderTvis/thinkrail), branch `claude-code-integration-plugin-api`. Checked daily at 03:00 UTC and published when the fork changes. The CLI is available as `thinkrail`; the desktop app is `ThinkRail-canary.app`.

```sh
# CLI
brew install commandertvis/thinkrail/thinkrail
brew upgrade commandertvis/thinkrail/thinkrail
brew uninstall commandertvis/thinkrail/thinkrail

# Desktop
brew install --cask commandertvis/thinkrail/thinkrail-desktop
brew upgrade --cask commandertvis/thinkrail/thinkrail-desktop
brew uninstall --cask commandertvis/thinkrail/thinkrail-desktop
```

Update the CLI through Homebrew, not its built-in self-update command. The desktop also supports in-app updates from this tap's `desktop-updates` release feed (Electrobun's auto-updater, `auto_updates true`).

## SharpRail (nightly)

The [CommanderTvis SharpRail](https://github.com/CommanderTvis/sharprail) desktop app, Apple Silicon only, downloaded from its rolling `nightly` release. The cask is hand-written and is `version :latest` with no checksum pin, so `brew upgrade --cask --greedy` re-downloads the current build. This package is not installation-tested by this repository's workflow.

```sh
brew install --cask commandertvis/thinkrail/sharprail
brew upgrade --cask --greedy commandertvis/thinkrail/sharprail
brew uninstall --cask commandertvis/thinkrail/sharprail
```

## How it moves

`.github/workflows/nightly.yml` runs daily at 03:00 UTC (or on demand). It compares the fork branch head with `nightly.sha`, the commit behind the current formula, and stops there when they match. Otherwise it checks out that commit, runs the fork's own `build-binary` composite action on a macOS arm64 runner (version `0.0.0-nightly.<UTC timestamp>`, channel `nightly`), publishes the CLI binary and the DMG as a `v<version>` release here, overwrites the `desktop-updates` release assets that the app's in-app updater polls, rewrites `Formula/thinkrail.rb` and `Casks/thinkrail-desktop.rb`, installs both from the tap on the runner as a check, and pushes.

The workflow is the only writer of the formula, the `thinkrail-desktop` cask, and `nightly.sha`. The `sharprail` cask is not touched by it.

## Remove the tap

```sh
brew untap commandertvis/thinkrail
```

Removing the tap alone does not uninstall any package or disable desktop in-app updates.

## Before installing

These are unofficial, unsigned builds. No Apple Developer ID signature or notarization ticket is attached, and macOS Gatekeeper blocks unnotarized applications downloaded from the internet by default. The casks run a postflight step that clears the quarantine flag so installs and upgrades work without manual terminal commands; this does not otherwise disable macOS security protections. SHA256 checksums pin the `thinkrail` formula and `thinkrail-desktop` cask downloads; they verify integrity, not publisher identity. The `sharprail` cask is unpinned.

The desktop shares its canary installation identity with other ThinkRail canary distributions. Back up your data before switching distributions; do not expect them to coexist side by side.
