class Jota < Formula
  desc "Monero-inspired wallet for IOTA Rebased"
  homepage "https://github.com/franzos/jota"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/franzos/jota/releases/download/v#{version}/jota-aarch64-apple-darwin.tar.gz"
      sha256 "48f0ecafb39deb97b06648d7f3f50ef198174b22c0dc5c042cc62d2dc9111a00"
    else
      url "https://github.com/franzos/jota/releases/download/v#{version}/jota-x86_64-apple-darwin.tar.gz"
      sha256 "546da9f1ae1a76c6f4067b8754a15d01af5fa6db1e78d00fbb3b308dd5178736"
    end
  end

  on_linux do
    url "https://github.com/franzos/jota/releases/download/v#{version}/jota-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "eaa35a43a14a3e74e23e234b41b9ea0605bcf0ed27884d05119a067e203a9b54"
  end

  def install
    bin.install "jota"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jota --version")
  end
end
