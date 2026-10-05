# frozen_string_literal: true

cask "gifted" do
  version "0.5.0"
  sha256 "4f6e12bf6226062f559a300e0bf958a82512e03b6973713abc5f4ee8849e8922"

  url "https://api.playsthetic.com/v1/gifted/download/#{version}/aarch64-apple-darwin"
  name "Gifted"
  desc "GIF-based infinite music videos reacting to live audio"
  homepage "https://playsthetic.com/gifted"

  livecheck do
    url "https://api.playsthetic.com/v1/gifted"
    strategy :json do |json|
      json["latest"]
    end
  end

  depends_on macos: :ventura

  app "Gifted.app"

  zap trash: [
    "~/Library/Application Support/com.playsthetic.gifted",
    "~/Library/Caches/com.playsthetic.gifted",
    "~/Library/Preferences/com.playsthetic.gifted.plist",
  ]
end
