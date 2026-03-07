class Tku < Formula
  desc "Token Usage CLI for Claude Code, Codex and others"
  homepage "https://github.com/franzos/tku"
  version "0.1.7"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/franzos/tku/releases/download/v#{version}/tku-aarch64-apple-darwin.tar.gz"
      sha256 "f8c64f7a21781f230245031a79233ea7fa5912e2bf3e2cd3203ca454ee9a05bc"
    else
      url "https://github.com/franzos/tku/releases/download/v#{version}/tku-x86_64-apple-darwin.tar.gz"
      sha256 "84bfcf9a7e7aebcfed5d95f2d9c3f958d35c749a5bc2fcb3b79be7583ad2981f"
    end
  end

  on_linux do
    url "https://github.com/franzos/tku/releases/download/v#{version}/tku-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7b9cf7b17f9b930ce76a94e715f2db3da5a52a1dc46593362fa1da29292b9589"
  end

  def install
    bin.install "tku"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tku --version")
  end
end
