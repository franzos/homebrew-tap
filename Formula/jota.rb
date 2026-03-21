class Jota < Formula
  desc "Monero-inspired wallet for IOTA Rebased"
  homepage "https://github.com/franzos/jota"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/franzos/jota/releases/download/v#{version}/jota-aarch64-apple-darwin.tar.gz"
      sha256 "4c4dc88709c98b62da6154fbc52898a329a901842a3bc23c441baa3a30de4274"
    else
      url "https://github.com/franzos/jota/releases/download/v#{version}/jota-x86_64-apple-darwin.tar.gz"
      sha256 "0657ebd6d063c9b276af7a432647c83f6180dd07b143ea9fcdb80bb225b7266a"
    end
  end

  on_linux do
    url "https://github.com/franzos/jota/releases/download/v#{version}/jota-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5560535b487adcc769151f8bafcbef38cf0d9b40cf913a24d2162debccbd53c7"
  end

  def install
    bin.install "jota"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jota --version")
  end
end
