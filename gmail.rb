# Homebrew formula for Gmail CLI
# Formula name: gmail
# Tap: nitaiaharoni1

class Gmail < Formula
  desc "Command-line interface for Gmail"
  homepage "https://github.com/nitaiaharoni1/gmail-cli"
  url "https://github.com/nitaiaharoni1/gmail-cli/archive/refs/tags/v1.0.5.tar.gz"
  version "1.0.5"
  sha256 "a1ae0162043bb9970d505c7032e2da0796c7018bb71480bab74e9aa6a0281be8"
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

