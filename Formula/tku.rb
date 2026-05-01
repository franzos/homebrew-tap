class Tku < Formula
  desc "Token Usage CLI for Claude Code, Codex and others"
  homepage "https://github.com/franzos/tku"
  version "0.1.12"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/franzos/tku/releases/download/v#{version}/tku-aarch64-apple-darwin.tar.gz"
      sha256 "21eb07bc2fad25319eb44a4fb1966fbc18a02bd3157e1cc171137b2bc8336309"
    else
      url "https://github.com/franzos/tku/releases/download/v#{version}/tku-x86_64-apple-darwin.tar.gz"
      sha256 "b0f9e5150b2ca2f42b2f5da7fb9865eb81a11a205ba60b75457ad4cd740e4824"
    end
  end

  on_linux do
    url "https://github.com/franzos/tku/releases/download/v#{version}/tku-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fb4ac7267402c6b20a3a36ca6a14222f5819ac3f16fbf699981fc43ec5e9fcc6"
  end

  def install
    bin.install "tku"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tku --version")
  end
end
