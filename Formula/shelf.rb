class Shelf < Formula
  desc "CLI for cataloguing files by metadata-driven rules"
  homepage "https://github.com/franzos/shelf"
  version "0.1.0"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/franzos/shelf/releases/download/v#{version}/shelf-aarch64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "https://github.com/franzos/shelf/releases/download/v#{version}/shelf-x86_64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    url "https://github.com/franzos/shelf/releases/download/v#{version}/shelf-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end

  def install
    bin.install "shelf"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shelf --version")
  end
end
