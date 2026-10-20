class Tku < Formula
  desc "Token Usage CLI for Claude Code, Codex and others"
  homepage "https://github.com/franzos/tku"
  version "0.1.28"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/franzos/tku/releases/download/v#{version}/tku-aarch64-apple-darwin.tar.gz"
      sha256 "ff2b3135156da203012b7617b84ecdf0d8dce0445ed14c691e0d718ac65fe60f"
    else
      url "https://github.com/franzos/tku/releases/download/v#{version}/tku-x86_64-apple-darwin.tar.gz"
      sha256 "ea4c7926e16ebc485666a58e94132df2c1ed111968b98be42f4debae7919f8af"
    end
  end

  on_linux do
    url "https://github.com/franzos/tku/releases/download/v#{version}/tku-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d835d5cb71dcf7b67f399789e1966eec98b4610f73ef9232adf2379ec89ac117"
  end

  def install
    bin.install "tku"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tku --version")
  end
end
