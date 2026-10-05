# frozen_string_literal: true

cask "playa" do
  version "1.6.0"
  sha256 "974d51b41db57d02092fab4b49e644ffbccd49229dd5586d893b9587b4ce834b"

  url "https://api.playsthetic.com/v1/playa/download/#{version}/aarch64-apple-darwin"
  name "Playa"
  desc "Play your own music"
  homepage "https://playsthetic.com/playa"

  livecheck do
    url "https://api.playsthetic.com/v1/playa"
    strategy :json do |json|
      json["latest"]
    end
  end

  depends_on macos: :tahoe

  app "Playa.app"

  zap trash: [
    "~/Library/Application Scripts/com.playsthetic.playa",
    "~/Library/Containers/com.playsthetic.playa",
  ]
end
