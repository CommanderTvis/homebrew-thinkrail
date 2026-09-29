cask "thinkrail-desktop" do
  version "0.0.0-nightly.202609290930"
  sha256 "2a3b1b4c2e1328bbbdd256755c4d6cb4e0c074c6ed04e47bfd23b6bcdd3b3190"

  url "https://github.com/CommanderTvis/homebrew-thinkrail/releases/download/v0.0.0-nightly.202609290930/thinkrail-desktop-darwin-arm64.dmg"
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
