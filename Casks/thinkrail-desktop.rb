cask "thinkrail-desktop" do
  version "0.0.0-nightly.202610190831"
  sha256 "c80fe7c47ab29759c057b66d5e0c95ec0cdf5006cf2618e63be05d6540b2e6dc"

  url "https://github.com/CommanderTvis/homebrew-thinkrail/releases/download/v0.0.0-nightly.202610190831/thinkrail-desktop-darwin-arm64.dmg"
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
