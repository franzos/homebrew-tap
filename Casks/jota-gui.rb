cask "jota-gui" do
  version "0.2.1"

  if Hardware::CPU.arm?
    url "https://github.com/franzos/jota/releases/download/v#{version}/jota-gui-aarch64-apple-darwin.dmg"
    sha256 "de5cf9e49081cf33d88c844154e811679823a635ab77ed16d6383d97943e859d"
  else
    url "https://github.com/franzos/jota/releases/download/v#{version}/jota-gui-x86_64-apple-darwin.dmg"
    sha256 "7ee8d3df1f7e666d5d3df616c4d34d09d26a99a3ff5e992693de448dccee2786"
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
