cask "gitfox" do
  version "3.0.5,7583"
  sha256 "4e6468fea95f95df8e3526b78b94a435360467ea44f9b8861e063a3554dc2c6b"

  url "https://storage.googleapis.com/gitfox/builds/retail/#{version.csv.second}/Gitfox.#{version.csv.second}.zip",
      verified: "storage.googleapis.com/gitfox/"
  name "Gitfox"
  desc "Git client"
  homepage "https://www.gitfox.app/"

  livecheck do
    url "https://storage.googleapis.com/gitfox/Gitfox.latest.stable.zip"
    strategy :extract_plist
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "Gitfox.app"
  binary "#{appdir}/Gitfox.app/Contents/SharedSupport/bin/gitfox-cli", target: "gitfox"

  zap trash: [
    "~/Library/Application Support/com.bytieful.Gitfox",
    "~/Library/Application Support/com.bytieful.Gitfox-retail",
    "~/Library/Application Support/Gitfox",
    "~/Library/Caches/com.bytieful.Gitfox",
    "~/Library/Caches/com.bytieful.Gitfox-retail",
    "~/Library/Caches/com.crashlytics.data/com.bytieful.Gitfox",
    "~/Library/Preferences/com.bytieful.Gitfox.*",
    "~/Library/Preferences/com.bytieful.Gitfox-retail.plist",
    "~/Library/Saved Application State/com.bytieful.Gitfox-retail.savedState",
    "~/Library/WebKit/com.bytieful.Gitfox",
  ]
end
