cask "thinkrail-desktop" do
  version "0.0.0-nightly.202609280924"
  sha256 "c747ee93ae36af1914f97c1712d771c8fb26b59041cf32c673d53afbde5eae51"

  url "https://github.com/CommanderTvis/homebrew-thinkrail/releases/download/v0.0.0-nightly.202609280924/thinkrail-desktop-darwin-arm64.dmg"
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
