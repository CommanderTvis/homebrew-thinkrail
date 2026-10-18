cask "sharprail" do
  version :latest
  sha256 :no_check

  url "https://github.com/CommanderTvis/sharprail/releases/download/nightly/SharpRail-nightly.dmg"
  name "SharpRail"
  desc "SharpRail desktop app, nightly"
  homepage "https://github.com/CommanderTvis/sharprail"

  depends_on arch: :arm64

  app "SharpRail.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/SharpRail.app"]
  end
end
