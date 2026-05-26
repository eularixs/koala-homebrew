cask "koala" do
  version "0.1.0"
  sha256 "994a8f4702ffdf6acbe3701a887af11a58ac2ea93db2ee2a7eb5ce86fd5333c4"

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
