cask "jota-gui" do
  version "0.2.4"

  if Hardware::CPU.arm?
    url "https://github.com/franzos/jota/releases/download/v#{version}/jota-gui-aarch64-apple-darwin.dmg"
    sha256 "eb217055ec27eec7120f522695b1622c55452fa3152b021fa2a210a1e01634cf"
  else
    url "https://github.com/franzos/jota/releases/download/v#{version}/jota-gui-x86_64-apple-darwin.dmg"
    sha256 "7c6af21b8eda969f77f005c6fbafd52caeadd6d344a133f4e3cb66ca883d28b3"
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
