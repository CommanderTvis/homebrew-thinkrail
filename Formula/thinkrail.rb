class Thinkrail < Formula
  desc "ThinkRail CLI host, CommanderTvis fork nightly"
  homepage "https://github.com/CommanderTvis/thinkrail"
  version "0.0.0-nightly.202609280924"
  url "https://github.com/CommanderTvis/homebrew-thinkrail/releases/download/v0.0.0-nightly.202609280924/thinkrail-darwin-arm64"
  sha256 "099de64e1057a09372c28b1f7de58b57b7495026e026a0bb27604e79ef6fb2ac"
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
