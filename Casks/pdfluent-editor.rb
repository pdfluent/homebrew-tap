cask "pdfluent-editor" do
  version "1.1.2"
  sha256 "54b7c1b66e33fe6aefc8a7e2152027db9945ea09ecd25a38527782527df49bf8"

  url "https://pdfluent.com/releases/#{version}/PDFluent_#{version}_universal.dmg"
  name "PDFluent"
  desc "PDF editor that works offline"
  homepage "https://pdfluent.com/"

  livecheck do
    url "https://pdfluent.com/releases/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on macos: :catalina

  app "PDFluent.app"

  zap trash: [
    "~/Library/Application Support/com.pdfluent.app",
    "~/Library/Caches/com.pdfluent.app",
    "~/Library/Preferences/com.pdfluent.app.plist",
    "~/Library/Saved Application State/com.pdfluent.app.savedState",
  ]
end
