cask "koala" do
  version "0.2.1"
  sha256 "4f9be810294841ed9b9707779b48fe153707b7131a0a29163de6b13beeb97719"

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
    "~/Library/Application Support/Koala",
    "~/Library/Preferences/com.koala.plist",
    "~/Library/Caches/com.koala",
  ]
end
