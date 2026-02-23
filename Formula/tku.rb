class Tku < Formula
  desc "Token Usage CLI for Claude Code, Codex and others"
  homepage "https://github.com/franzos/tku"
  version "0.1.5"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/franzos/tku/releases/download/v#{version}/tku-aarch64-apple-darwin.tar.gz"
      sha256 "37f32d2784c3a3cc9cec518c816a7f7514d4ffdce2d936e805c984d2de89b29d"
    else
      url "https://github.com/franzos/tku/releases/download/v#{version}/tku-x86_64-apple-darwin.tar.gz"
      sha256 "d6ba35fa93b48c1bb02ade8da5dbfb6da89c69352ea09d7dc7923eca1072928a"
    end
  end

  on_linux do
    url "https://github.com/franzos/tku/releases/download/v#{version}/tku-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d90c74c4da6b35f954f838b7ddeab6fb16b00a3cc128f6eb6b0c7d9a0de4ad55"
  end

  def install
    bin.install "tku"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tku --version")
  end
end
