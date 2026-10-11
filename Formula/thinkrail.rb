class Thinkrail < Formula
  desc "ThinkRail CLI host, CommanderTvis fork nightly"
  homepage "https://github.com/CommanderTvis/thinkrail"
  version "0.0.0-nightly.202610110942"
  url "https://github.com/CommanderTvis/homebrew-thinkrail/releases/download/v0.0.0-nightly.202610110942/thinkrail-darwin-arm64"
  sha256 "05eb847246f27034ebaef981a034ab46e3cdf45b223d025d9f9f12bd9d577858"
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
