# frozen_string_literal: true

cask "rollpaper" do
  version "1.5.0"
  sha256 "6d060fc52769983195d6fe256cae08ac07279ee942d6ac113c59f1c82c61d278"

  url "https://api.playsthetic.com/v1/rollpaper/download/#{version}/aarch64-apple-darwin"
  name "Rollpaper"
  desc "Menu-bar wallpaper rotator"
  homepage "https://playsthetic.com/rollpaper"

  livecheck do
    url "https://api.playsthetic.com/v1/rollpaper"
    strategy :json do |json|
      json["latest"]
    end
  end

  depends_on macos: :sonoma

  app "Rollpaper.app"

  zap trash: [
    "~/Library/Application Support/Rollpaper",
    "~/Library/Caches/com.playsthetic.rollpaper",
    "~/Library/Preferences/com.playsthetic.rollpaper.plist",
  ]
end
