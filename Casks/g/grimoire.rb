# frozen_string_literal: true

cask "grimoire" do
  version "0.5.0"
  sha256 "ec899e837d91e099268d20ef5150f378547f862cd5ee66e7c1fb5bf77cddfa59"

  url "https://api.playsthetic.com/v1/grimoire/download/#{version}/aarch64-apple-darwin"
  name "Grimoire"
  desc "Read the comics you already own"
  homepage "https://playsthetic.com/grimoire"

  livecheck do
    url "https://api.playsthetic.com/v1/grimoire"
    strategy :json do |json|
      json["latest"]
    end
  end

  depends_on macos: :tahoe

  app "Grimoire.app"

  zap trash: [
    "~/Library/Application Scripts/com.playsthetic.grimoire",
    "~/Library/Containers/com.playsthetic.grimoire",
  ]
end
