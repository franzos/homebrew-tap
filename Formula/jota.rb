class Jota < Formula
  desc "Monero-inspired wallet for IOTA Rebased"
  homepage "https://github.com/franzos/jota"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/franzos/jota/releases/download/v#{version}/jota-aarch64-apple-darwin.tar.gz"
      sha256 "0849476d2f417383483905dba92d14e0a66ed64b230e1a02a4c2587a0c2fb4eb"
    else
      url "https://github.com/franzos/jota/releases/download/v#{version}/jota-x86_64-apple-darwin.tar.gz"
      sha256 "e50ac438eec768e9f36687d3ac305344cd399b4b99856fc0246e67649e64772f"
    end
  end

  on_linux do
    url "https://github.com/franzos/jota/releases/download/v#{version}/jota-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "31915c38d5edabd44c9faa4dcb57ed39129f3862a4f7b094fbecf60740cdd71d"
  end

  def install
    bin.install "jota"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jota --version")
  end
end
