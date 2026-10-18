class Shelf < Formula
  desc "CLI for cataloguing files by metadata-driven rules"
  homepage "https://github.com/franzos/shelf"
  version "0.1.2"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/franzos/shelf/releases/download/v#{version}/shelf-aarch64-apple-darwin.tar.gz"
      sha256 "8e3ac93bad02dba90aeaf240a724f6ad8332dd97c37d22fbedd842c88cff3520"
    else
      url "https://github.com/franzos/shelf/releases/download/v#{version}/shelf-x86_64-apple-darwin.tar.gz"
      sha256 "8e3ac93bad02dba90aeaf240a724f6ad8332dd97c37d22fbedd842c88cff3520"
    end
  end

  on_linux do
    url "https://github.com/franzos/shelf/releases/download/v#{version}/shelf-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8e3ac93bad02dba90aeaf240a724f6ad8332dd97c37d22fbedd842c88cff3520"
  end

  def install
    bin.install "shelf"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shelf --version")
  end
end
