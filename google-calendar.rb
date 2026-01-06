# Homebrew formula for Google Calendar CLI
# Formula name: google-calendar
# Tap: nitaiaharoni1

class GoogleCalendar < Formula
  desc "Command-line interface for Google Calendar"
  homepage "https://github.com/nitaiaharoni1/google-calendar-cli"
  url "https://github.com/nitaiaharoni1/google-calendar-cli/archive/refs/tags/v1.4.0.tar.gz"
  version "1.4.0"
  sha256 "4a111435fc84f28ff1237951b2c2ec3692f962a515d4c145dcbaa8d1eca17add"
  license "MIT"
  head "https://github.com/nitaiaharoni1/google-calendar-cli.git", branch: "main"

  depends_on "python@3.11"

  def install
    python3 = "python3.11"
    system python3, "-m", "pip", "install", "--prefix=#{prefix}", "."
  end

  test do
    system "#{bin}/google-calendar", "--version"
  end

  def caveats
    <<~EOS
      Google Calendar CLI has been installed!

      To get started:
      1. Download credentials.json from Google Cloud Console:
         - Go to https://console.cloud.google.com/
         - Create/select a project
         - Enable Google Calendar API
         - Create OAuth 2.0 credentials (Desktop app)
         - Download as credentials.json
         - Place it in the current directory or ~/

      2. Run setup:
         google-calendar init

      3. Then use: google-calendar help
    EOS
  end
end

