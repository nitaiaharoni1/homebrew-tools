# Homebrew formula for Gmail CLI
# Formula name: gmail
# Tap: nitaiaharoni1

class Gmail < Formula
  desc "Command-line interface for Gmail"
  homepage "https://github.com/nitaiaharoni1/gmail-cli"
  url "https://github.com/nitaiaharoni1/gmail-cli/archive/refs/tags/v1.2.2.tar.gz"
  version "1.2.2"
  sha256 "d50062c5cdf9872aae5f7241c83c12b165c20d1c75a1555ae74b62c2a4ec253c"
  license "MIT"
  head "https://github.com/nitaiaharoni1/gmail-cli.git", branch: "main"

  depends_on "python@3.11"

  def install
    python3 = "python3.11"
    system python3, "-m", "pip", "install", "--prefix=#{prefix}", "."
  end

  test do
    system "#{bin}/gmail", "--version"
  end

  def caveats
    <<~EOS
      Gmail CLI has been installed!

      To get started:
      1. Download credentials.json from Google Cloud Console:
         - Go to https://console.cloud.google.com/
         - Create/select a project
         - Enable Gmail API
         - Create OAuth 2.0 credentials (Desktop app)
         - Download as credentials.json
         - Place it in the current directory or ~/

      2. Run setup:
         gmail init

      3. Then use: gmail help
    EOS
  end
end

