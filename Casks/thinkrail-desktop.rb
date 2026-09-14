cask "thinkrail-desktop" do
  version "0.0.0-nightly.202609141702"
  sha256 "d870d6a64d1dfffbc14816fe39191e6716f960cc73cb015d12687e3bed1a89b4"

  url "https://github.com/CommanderTvis/homebrew-thinkrail/releases/download/v0.0.0-nightly.202609141702/thinkrail-desktop-darwin-arm64.dmg"
  name "ThinkRail"
  desc "ThinkRail desktop app, CommanderTvis fork nightly"
  homepage "https://github.com/CommanderTvis/thinkrail"

  auto_updates true
  depends_on arch: :arm64

  app "ThinkRail-canary.app"
end
