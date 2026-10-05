# frozen_string_literal: true

cask "peel" do
  version "1.5.0"
  sha256 "224bd087a83ffa10125ebcc352d9cc17ff45e0acfd58003d5d04d453d500d20a"

  url "https://api.playsthetic.com/v1/peel/download/#{version}/aarch64-apple-darwin"
  name "Peel"
  desc "Leverageable tagging"
  homepage "https://playsthetic.com/peel"

  livecheck do
    url "https://api.playsthetic.com/v1/peel"
    strategy :json do |json|
      json["latest"]
    end
  end

  depends_on macos: :ventura

  app "Peel.app"

  zap trash: [
    "~/Library/Application Scripts/com.playsthetic.peel",
    "~/Library/Containers/com.playsthetic.peel",
  ]
end
