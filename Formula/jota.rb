class Jota < Formula
  desc "Monero-inspired wallet for IOTA Rebased"
  homepage "https://github.com/franzos/jota"
  version "0.2.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/franzos/jota/releases/download/v#{version}/jota-aarch64-apple-darwin.tar.gz"
      sha256 "f20c358cbb3075d83226a29540990a03ab22db3be32ad72455843d6a68a52af1"
    else
      url "https://github.com/franzos/jota/releases/download/v#{version}/jota-x86_64-apple-darwin.tar.gz"
      sha256 "a3ba58b362687d43eccc46462a5921371f89b077725c2dab38426335c9a13ebe"
    end
  end

  on_linux do
    url "https://github.com/franzos/jota/releases/download/v#{version}/jota-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e8aa1abe7a2ea05e57f0555d03a8baf457223b72aa743e9d7572c09638e380d3"
  end

  def install
    bin.install "jota"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jota --version")
  end
end
