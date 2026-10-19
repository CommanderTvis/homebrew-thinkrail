class Thinkrail < Formula
  desc "ThinkRail CLI host, CommanderTvis fork nightly"
  homepage "https://github.com/CommanderTvis/thinkrail"
  version "0.0.0-nightly.202610190831"
  url "https://github.com/CommanderTvis/homebrew-thinkrail/releases/download/v0.0.0-nightly.202610190831/thinkrail-darwin-arm64"
  sha256 "ec09375c3bb53587199c22a866f3bb68f460eb6e54b04e7ee2e5ac3362130e3a"
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
