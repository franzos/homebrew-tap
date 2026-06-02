class Tku < Formula
  desc "Token Usage CLI for Claude Code, Codex and others"
  homepage "https://github.com/franzos/tku"
  version "0.1.14"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/franzos/tku/releases/download/v#{version}/tku-aarch64-apple-darwin.tar.gz"
      sha256 "9f0fb19167697607df7ed5a691b52b449be5488331755ec154b165e81226d57b"
    else
      url "https://github.com/franzos/tku/releases/download/v#{version}/tku-x86_64-apple-darwin.tar.gz"
      sha256 "10d0b8f50f3b5e6f91e390a2c3381a38de40ce9ccad53394f22fa5de91f55ae9"
    end
  end

  on_linux do
    url "https://github.com/franzos/tku/releases/download/v#{version}/tku-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e32237417d7aff124dd3237a975802f73d2e5e0a545617b7744814485d477136"
  end

  def install
    bin.install "tku"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tku --version")
  end
end
