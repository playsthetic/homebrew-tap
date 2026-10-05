# frozen_string_literal: true

cask "ramble" do
  version "1.2.0"
  sha256 "8c2908809632ac85de79a61aa715b005cdc11a5ce8a1a76f73a389a73ff094ab"

  url "https://api.playsthetic.com/v1/ramble/download/#{version}/aarch64-apple-darwin"
  name "Ramble"
  desc "Cross-post with ease"
  homepage "https://playsthetic.com/ramble"

  livecheck do
    url "https://api.playsthetic.com/v1/ramble"
    strategy :json do |json|
      json["latest"]
    end
  end

  depends_on macos: :ventura

  app "Ramble.app"

  zap trash: [
    "~/Library/Application Support/com.playsthetic.ramble",
    "~/Library/Caches/com.playsthetic.ramble",
    "~/Library/Preferences/com.playsthetic.ramble.plist",
  ]
end
