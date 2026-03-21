cask "jota-gui" do
  version "0.2.5"

  if Hardware::CPU.arm?
    url "https://github.com/franzos/jota/releases/download/v#{version}/jota-gui-aarch64-apple-darwin.dmg"
    sha256 "87286c1978abc6bd8e6b9e4419ca4b745875ff75f6f3b9a6c532bc25006a177e"
  else
    url "https://github.com/franzos/jota/releases/download/v#{version}/jota-gui-x86_64-apple-darwin.dmg"
    sha256 "3ef8a558d9edef41b22ee0a4aa7428ed1d701cfb3b9881a0af54580a793381ff"
  end

  name "Jota"
  desc "Monero-inspired wallet for IOTA Rebased"
  homepage "https://github.com/franzos/jota"

  app "Jota.app"

  zap trash: [
    "~/Library/Application Support/com.jota.app",
    "~/Library/Preferences/com.jota.app.plist",
  ]
end
