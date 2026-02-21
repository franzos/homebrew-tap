class Envstash < Formula
  desc "Manage .env files across git branches with versioning, diffing, and optional encryption"
  homepage "https://github.com/franzos/envstash"
  version "0.1.8"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/franzos/envstash/releases/download/v#{version}/envstash-aarch64-apple-darwin.tar.gz"
      sha256 "c4a78e5efc6617e4bf27c1dfd1ee2e485d93d79f468b6ef76c7898fc295b938e"
    else
      url "https://github.com/franzos/envstash/releases/download/v#{version}/envstash-x86_64-apple-darwin.tar.gz"
      sha256 "3195772eb5e1e38bbf05016905cf1aa9adcf1329251d847c16494388930cc5d0"
    end
  end

  on_linux do
    url "https://github.com/franzos/envstash/releases/download/v#{version}/envstash-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "af79701300947844a81d4ab864bfba3e8f8cdc48d2d314eea6d8b2c99d37f946"
  end

  def install
    bin.install "envstash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/envstash --version")
  end
end
