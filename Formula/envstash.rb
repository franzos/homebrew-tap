class Envstash < Formula
  desc "Manage .env files across git branches with versioning, diffing, and optional encryption"
  homepage "https://github.com/franzos/envstash"
  version "0.1.12"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/franzos/envstash/releases/download/v#{version}/envstash-aarch64-apple-darwin.tar.gz"
      sha256 "7c7397d08e1e924b4af379d5b040a79d18d56888ba33ce46fc0fc0acd21137dd"
    else
      url "https://github.com/franzos/envstash/releases/download/v#{version}/envstash-x86_64-apple-darwin.tar.gz"
      sha256 "134709b5f3401ab0daf2dbdc07328da869a33f314486fb615b56a137361cdc07"
    end
  end

  on_linux do
    url "https://github.com/franzos/envstash/releases/download/v#{version}/envstash-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "30a6b69b359a9cbfcd12fc1fba63f8ab6594d5ccb38dc4ee2d002c222248164f"
  end

  def install
    bin.install "envstash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/envstash --version")
  end
end
