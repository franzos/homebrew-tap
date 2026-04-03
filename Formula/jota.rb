class Jota < Formula
  desc "Monero-inspired wallet for IOTA Rebased"
  homepage "https://github.com/franzos/jota"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/franzos/jota/releases/download/v#{version}/jota-aarch64-apple-darwin.tar.gz"
      sha256 "21fb9afd48899953fc72e1526db4bd819a229c94497c8dfe288faca80fb56a08"
    else
      url "https://github.com/franzos/jota/releases/download/v#{version}/jota-x86_64-apple-darwin.tar.gz"
      sha256 "5355172a03221a5988f80f484d71ce9a36ed7ed82ad0917042ec678c01e46e35"
    end
  end

  on_linux do
    url "https://github.com/franzos/jota/releases/download/v#{version}/jota-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a5a2fb7a1b301cd0f8c0db79ed9809cc53a39c4202e647eb841275c0c647d713"
  end

  def install
    bin.install "jota"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jota --version")
  end
end
