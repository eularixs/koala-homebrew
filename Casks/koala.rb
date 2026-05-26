cask "koala" do
  version "0.1.1"
  sha256 "16001efe3d0853bcd066631d180ccec13a5203436a5879ab729249a8ae2dfecd"

  url "https://github.com/eularixs/koala/releases/download/v#{version}/koala-#{version}.dmg"
  name "Koala"
  desc "Native macOS API client (Postman-like)"
  homepage "https://github.com/eularixs/koala"

  app "koala.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/koala.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/koala",
    "~/Library/Preferences/com.koala.plist",
    "~/Library/Caches/com.koala",
  ]
end
