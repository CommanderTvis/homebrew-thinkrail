# homebrew-thinkrail

Homebrew tap for the CommanderTvis fork of ThinkRail (`CommanderTvis/thinkrail`, branch `claude-code-integration-plugin-api`).
Publishes nightly builds for Apple Silicon (`darwin-arm64`).

## Artifacts

The repository manages two packages:
- Formula `Formula/thinkrail.rb` installs the CLI host binary `thinkrail`.
- Cask `Casks/thinkrail-desktop.rb` installs the Electrobun desktop app `ThinkRail-canary.app`.

Nightly builds are unsigned and not notarized. The cask strips quarantine (`com.apple.quarantine`) during postflight so Gatekeeper does not flag the app as damaged. Homebrew 7+ requires running `brew trust --tap commandertvis/thinkrail` before loading packages from this tap.

## Ownership and workflow generation

The nightly workflow `.github/workflows/nightly.yml` is the primary writer of `Formula/thinkrail.rb`, `Casks/thinkrail-desktop.rb`, and `nightly.sha`.
The workflow runs daily at 03:00 UTC or via `workflow_dispatch`:
- Compares `CommanderTvis/thinkrail@claude-code-integration-plugin-api` head commit against `nightly.sha`.
- Exits early if the source commit has not changed.
- Builds the CLI binary and macOS DMG using the upstream `.github/actions/build-binary` composite action.
- Publishes tag `v<version>` releases and updates assets under the `desktop-updates` release tag for in-app updates.
- Regenerates `Formula/thinkrail.rb`, `Casks/thinkrail-desktop.rb`, and `nightly.sha`.
- Installs both packages on the macOS runner to verify them before pushing to `main`.

When updating formula or cask structure or install behavior, edit the templates in `.github/workflows/nightly.yml` in tandem with the static files in `Formula/` and `Casks/` so the next automated run preserves the changes.

## Verification

Run these checks when modifying tap definitions or automation:
- Verify Ruby syntax: `ruby -c Formula/thinkrail.rb && ruby -c Casks/thinkrail-desktop.rb`
- Validate YAML formatting and shell syntax in `.github/workflows/nightly.yml`
- When the tap is installed locally, run `brew audit --formula commandertvis/thinkrail/thinkrail` or `brew style Formula/thinkrail.rb Casks/thinkrail-desktop.rb`
