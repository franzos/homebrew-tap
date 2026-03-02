class Envstash < Formula
  desc "Manage .env files across git branches with versioning, diffing, and optional encryption"
  homepage "https://github.com/franzos/envstash"
  version "0.1.10"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/franzos/envstash/releases/download/v#{version}/envstash-aarch64-apple-darwin.tar.gz"
      sha256 "e5e7c94fabf33afe1f42456a41c4a95f9ea3c2c6a9a8bf361a588821ce2eebff"
    else
      url "https://github.com/franzos/envstash/releases/download/v#{version}/envstash-x86_64-apple-darwin.tar.gz"
      sha256 "674ad379ee668f32c2a6e7061f1693d5e21e8d5c8af84d83dc4d68c5a36bb6f8"
    end
  end

  on_linux do
    url "https://github.com/franzos/envstash/releases/download/v#{version}/envstash-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "44c7b2f650324ded52d889604f6a5d0ee10b7aaac063e140ee9e8dd2ffc242d9"
  end

  def install
    bin.install "envstash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/envstash --version")
  end
end
