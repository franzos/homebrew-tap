class Vatic < Formula
  desc "TOML-configured AI agent framework with scheduled jobs and channel integrations"
  homepage "https://github.com/franzos/vatic"
  version "0.1.0"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/franzos/vatic/releases/download/v#{version}/vatic-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/franzos/vatic/releases/download/v#{version}/vatic-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    url "https://github.com/franzos/vatic/releases/download/v#{version}/vatic-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "PLACEHOLDER"
  end

  def install
    bin.install "vatic"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vatic --version")
  end
end
