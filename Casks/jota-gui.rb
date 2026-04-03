cask "jota-gui" do
  version "0.2.6"

  if Hardware::CPU.arm?
    url "https://github.com/franzos/jota/releases/download/v#{version}/jota-gui-aarch64-apple-darwin.dmg"
    sha256 "52352493d410bbee459ec573490d97ac34144519cb12e9ded407af820d129994"
  else
    url "https://github.com/franzos/jota/releases/download/v#{version}/jota-gui-x86_64-apple-darwin.dmg"
    sha256 "8341a6fd9cb658536cb27bfea4e1ed084a3ee57e933abe5e35c394c1f37e47fe"
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
