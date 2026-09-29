class Thinkrail < Formula
  desc "ThinkRail CLI host, CommanderTvis fork nightly"
  homepage "https://github.com/CommanderTvis/thinkrail"
  version "0.0.0-nightly.202609290930"
  url "https://github.com/CommanderTvis/homebrew-thinkrail/releases/download/v0.0.0-nightly.202609290930/thinkrail-darwin-arm64"
  sha256 "8a69a69025cf9a721ff4c9b85a4623b7517486253b72707f3ca95b13c0d96786"
  license "Apache-2.0"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "thinkrail-darwin-arm64" => "thinkrail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/thinkrail --version")
  end
end
