# Homebrew formula for Notion CLI
# Formula name: notion
# Tap: nitaiaharoni1/tools

class Notion < Formula
  desc "Powerful command-line interface for Notion built with pure bash"
  homepage "https://github.com/nitaiaharoni1/notion-cli"
  url "https://github.com/nitaiaharoni1/notion-cli/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d7f07cb405011862e147f36d0479183b73e6b5744a5869fb7d60feccacb01af9"
  license "MIT"
  head "https://github.com/nitaiaharoni1/notion-cli.git", branch: "main"

  depends_on "bash" => :build
  depends_on "curl"
  depends_on "python3"

  def install
    bin.install "notion-cli.sh" => "notion"
    # Make sure the script is executable
    chmod 0755, bin/"notion"
  end

  test do
    # Test that the script exists and is executable
    assert_match "Notion CLI", shell_output("#{bin}/notion help 2>&1", 0)
  end

  def caveats
    <<~EOS
      Notion CLI has been installed!

      To get started:
      1. Run setup: notion init

      The 'notion init' command will guide you through:
      - Getting a Notion integration token
      - Storing it securely
      - Testing the connection

      Then use: notion help

      Note: Make sure to share pages/databases with your integration in Notion.
    EOS
  end
end

