class Envstash < Formula
  desc "Manage .env files across git branches with versioning, diffing, and optional encryption"
  homepage "https://github.com/franzos/envstash"
  version "0.1.7"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/franzos/envstash/releases/download/v#{version}/envstash-aarch64-apple-darwin.tar.gz"
      sha256 "2bebdf9a78dc8f358a21e08aac5cbaf1cb8f41d3bce94030907fda7d97fb1c37"
    else
      url "https://github.com/franzos/envstash/releases/download/v#{version}/envstash-x86_64-apple-darwin.tar.gz"
      sha256 "c8da1440424028adbb227cf3f2ec00886dbf536a638ec5a04e628035b2ace406"
    end
  end

  on_linux do
    url "https://github.com/franzos/envstash/releases/download/v#{version}/envstash-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8ed6a68b61c4c6eaf4cf578c1846597fea8be776cc855dfff5a195aa43316f5e"
  end

  def install
    bin.install "envstash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/envstash --version")
  end
end
