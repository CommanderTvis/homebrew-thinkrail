cask "thinkrail-desktop" do
  version "0.0.0-nightly.202609300921"
  sha256 "a56d83de1f20ebd8ed6e56350d170f9d317f6eeec2b0facd2cfc3ec0d10ead3f"

  url "https://github.com/CommanderTvis/homebrew-thinkrail/releases/download/v0.0.0-nightly.202609300921/thinkrail-desktop-darwin-arm64.dmg"
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
