class Pdfluent < Formula
  desc "Command-line tool to extract, merge, split, protect, convert and sign PDFs"
  homepage "https://pdfluent.com/"
  url "https://static.crates.io/crates/pdfluent-cli/pdfluent-cli-1.4.0.crate"
  sha256 "10afbb4f6d8ee1fa5cbe58b00cd0c52653ad83ad0282ea44305b883b4dcde7f5"
  license any_of: ["AGPL-3.0-only", :cannot_represent]

  livecheck do
    url "https://crates.io/api/v1/crates/pdfluent-cli"
    strategy :json do |json|
      json.dig("crate", "max_stable_version")
    end
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pdfluent --version")
  end
end
