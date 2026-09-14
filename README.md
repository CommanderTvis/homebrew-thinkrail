# homebrew-thinkrail

Homebrew tap for the [CommanderTvis fork of ThinkRail](https://github.com/CommanderTvis/thinkrail):
nightly builds of the `claude-code-integration-plugin-api` branch for Apple Silicon.

```sh
brew trust --tap commandertvis/thinkrail   # Homebrew 7+ refuses untrusted third-party taps
brew tap commandertvis/thinkrail
brew install thinkrail                  # the CLI host
brew install --cask thinkrail-desktop   # the Electrobun desktop app (ThinkRail-canary.app)
```

Nightlies are unsigned and not notarized. The cask strips the quarantine flag after install, which is
what keeps Gatekeeper from reporting the app as damaged.

## How it moves

`.github/workflows/nightly.yml` runs daily at 03:00 UTC (or on demand). It compares the fork branch head
with `nightly.sha`, the commit behind the current formula, and stops there when they match. Otherwise it
checks out that commit, runs the fork's own `build-binary` composite action on a macOS arm64 runner
(version `0.0.0-nightly.<UTC timestamp>`, channel `nightly`), publishes the CLI binary and the DMG as a
`v<version>` release here, overwrites the `desktop-updates` release assets that the app's in-app updater
polls, rewrites `Formula/thinkrail.rb` and `Casks/thinkrail-desktop.rb`, installs both from the tap on the
runner as a check, and pushes.

The workflow is the only writer of the formula, the cask, and `nightly.sha`. The tap is never rebased.
