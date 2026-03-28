class Envstash < Formula
  desc "Manage .env files across git branches with versioning, diffing, and optional encryption"
  homepage "https://github.com/franzos/envstash"
  version "0.1.11"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/franzos/envstash/releases/download/v#{version}/envstash-aarch64-apple-darwin.tar.gz"
      sha256 "8633e419e2eba6171036afa404991b4b876d33376da71b79b21c1fd9353f1818"
    else
      url "https://github.com/franzos/envstash/releases/download/v#{version}/envstash-x86_64-apple-darwin.tar.gz"
      sha256 "2315ebb4c981001e2ad8dc4472e74ded388c985273300ea7b3fbaeadac3a84c9"
    end
  end

  on_linux do
    url "https://github.com/franzos/envstash/releases/download/v#{version}/envstash-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4450700e587ee885743a60235cde4609f0a55b246020ef833c4bb894b67c53fb"
  end

  def install
    bin.install "envstash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/envstash --version")
  end
end
