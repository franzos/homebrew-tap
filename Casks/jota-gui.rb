cask "jota-gui" do
  version "0.2.7"

  if Hardware::CPU.arm?
    url "https://github.com/franzos/jota/releases/download/v#{version}/jota-gui-aarch64-apple-darwin.dmg"
    sha256 "5ee488c7c582ed3766e19f02b1ca4fcf684ab9f061a81fd1bea2a640918fad4a"
  else
    url "https://github.com/franzos/jota/releases/download/v#{version}/jota-gui-x86_64-apple-darwin.dmg"
    sha256 "3d4adec6b5a32d78174ddfa7a63baabb52663b1075c533cf01449f43b8251209"
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
