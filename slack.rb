# Homebrew formula for Slack CLI
# Formula name: slack
# Tap: nitaiaharoni1/tools

class Slack < Formula
  desc "Powerful command-line interface for Slack built with pure bash"
  homepage "https://github.com/nitaiaharoni1/slack-cli"
  url "https://github.com/nitaiaharoni1/slack-cli/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "56888c3933822f355efd4f67a26977d5549511802455be606ab9a19143141c6b"
  license "MIT"
  head "https://github.com/nitaiaharoni1/slack-cli.git", branch: "main"

  depends_on "bash" => :build
  depends_on "curl"
  depends_on "python3"

  def install
    bin.install "slack-cli.sh" => "slack"
    # Make sure the script is executable
    chmod 0755, bin/"slack"
  end

  test do
    # Test that the script exists and is executable
    assert_match "Slack CLI", shell_output("#{bin}/slack help 2>&1", 1)
  end

  def caveats
    <<~EOS
      Slack CLI has been installed!

      To get started:
      1. Run setup: slack init

      The 'slack init' command will guide you through:
      - Getting a Slack token
      - Storing it securely
      - Testing the connection

      Then use: slack help

      Note: This replaces the official Slack CLI with your custom slack-cli.
      No need to source in your shell config - it works as a standalone command!
    EOS
  end
end


