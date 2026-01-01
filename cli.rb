# Homebrew formula for Slack CLI
# Formula name: cli
# Tap: nitaiaharoni1/slack

class Cli < Formula
  desc "Powerful command-line interface for Slack built with pure bash"
  homepage "https://github.com/nitaiaharoni1/slack-cli"
  url "https://github.com/nitaiaharoni1/slack-cli/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "a052fa5e9add669654163945119c315b356e38927c37a61519ea875d6e2f6d00"
  license "MIT"
  head "https://github.com/nitaiaharoni1/slack-cli.git", branch: "main"

  depends_on "bash" => :build
  depends_on "curl"
  depends_on "python3"

  def install
    bin.install "slack-cli.sh" => "slack-chat"
    # Make sure the script is executable
    chmod 0755, bin/"slack-chat"
  end

  def caveats
    <<~EOS
      Slack CLI has been installed!

      To get started:
      1. Run setup: slack-chat init

      The 'slack-chat init' command will guide you through:
      - Getting a Slack token
      - Storing it securely
      - Testing the connection

      Then use: slack-chat help

      Note: This installs as 'slack-chat' to coexist with official Slack CLI.
      No need to source in your shell config - it works as a standalone command!
    EOS
  end

  test do
    # Test that the script exists and is executable
    assert_match "Slack CLI", shell_output("#{bin}/slack-chat help 2>&1", 1)
  end
end

