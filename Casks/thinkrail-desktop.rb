cask "thinkrail-desktop" do
  version "0.0.0-nightly.202610110942"
  sha256 "af5d6c2eff21ad8abee4368d2510994c98d08d9087eeadaf97af56ebb41eb61f"

  url "https://github.com/CommanderTvis/homebrew-thinkrail/releases/download/v0.0.0-nightly.202610110942/thinkrail-desktop-darwin-arm64.dmg"
  name "ThinkRail"
  desc "ThinkRail desktop app, CommanderTvis fork nightly"
  homepage "https://github.com/CommanderTvis/thinkrail"

  auto_updates true
  depends_on arch: :arm64

  app "ThinkRail-canary.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/ThinkRail-canary.app"]
  end
end
