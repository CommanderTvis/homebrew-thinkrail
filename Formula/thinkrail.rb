class Thinkrail < Formula
  desc "ThinkRail CLI host, CommanderTvis fork nightly"
  homepage "https://github.com/CommanderTvis/thinkrail"
  version "0.0.0-nightly.202609300921"
  url "https://github.com/CommanderTvis/homebrew-thinkrail/releases/download/v0.0.0-nightly.202609300921/thinkrail-darwin-arm64"
  sha256 "ba764c5300817b1da6b34f307a46c626d6e51ce03c1fb13d1f23798ae9751488"
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
