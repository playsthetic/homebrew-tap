# frozen_string_literal: true

cask "gitoptic" do
  version "0.5.0"
  sha256 "ae6d2bedbb45445c5ef9ab85443d8d8c1296a174259ba1ad5f243e3262627e8d"

  url "https://api.playsthetic.com/v1/gitoptic/download/#{version}/aarch64-apple-darwin"
  name "Gitoptic"
  desc "Visual diffs for binary files in Git"
  homepage "https://playsthetic.com/gitoptic"

  livecheck do
    url "https://api.playsthetic.com/v1/gitoptic"
    strategy :json do |json|
      json["latest"]
    end
  end

  depends_on macos: :ventura

  app "Gitoptic.app"

  zap trash: [
    "~/Library/Application Support/com.playsthetic.gitoptic",
    "~/Library/Caches/com.playsthetic.gitoptic",
    "~/Library/Preferences/com.playsthetic.gitoptic.plist",
  ]
end
