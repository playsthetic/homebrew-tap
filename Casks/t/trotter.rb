# frozen_string_literal: true

cask "trotter" do
  version "0.5.0"
  sha256 "c7783fb0d051f06ff383bc520b28dca7a157695f7e96427bb7afe970ac023eeb"

  url "https://api.playsthetic.com/v1/trotter/download/#{version}/aarch64-apple-darwin"
  name "Trotter"
  desc "Trip mapping"
  homepage "https://playsthetic.com/trotter"

  livecheck do
    url "https://api.playsthetic.com/v1/trotter"
    strategy :json do |json|
      json["latest"]
    end
  end

  depends_on macos: :sonoma

  app "Trotter.app"

  zap trash: [
    "~/Library/Application Scripts/com.playsthetic.trotter",
    "~/Library/Containers/com.playsthetic.trotter",
  ]
end
