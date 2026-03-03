# Homebrew formula for MCP Reddit
# Formula name: mcp-reddit
# Tap: nitaiaharoni1/tools

class McpReddit < Formula
  desc "Model Context Protocol (MCP) server for Reddit API integration with AI assistants"
  homepage "https://github.com/nitaiaharoni1/reddit-mcp"
  url "https://github.com/nitaiaharoni1/reddit-mcp/archive/refs/tags/v1.1.8.tar.gz"
  sha256 "2de819d5b822a765e0b6790c5ff9ace3926fb39eca229f14aa5b99bb746d04a2"
  license "MIT"
  head "https://github.com/nitaiaharoni1/reddit-mcp.git", branch: "main"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "mcp-reddit", shell_output("#{bin}/mcp-reddit --version 2>&1", 0)
  end

  def caveats
    <<~EOS
      MCP Reddit has been installed!

      To use with Claude Desktop, add to your MCP config:
        {
          "mcpServers": {
            "reddit": {
              "command": "mcp-reddit",
              "env": {
                "REDDIT_CLIENT_ID": "your_client_id",
                "REDDIT_CLIENT_SECRET": "your_client_secret"
              }
            }
          }
        }

      Get your Reddit API credentials at:
        https://www.reddit.com/prefs/apps

      Features in v1.1.8:
        - Proactive rate limiting (100 QPM with dynamic backoff)
        - Exponential retry with jitter for 429/5xx/403 errors
        - Body-level RATELIMIT detection for posting cooldowns
        - Reddit-compliant User-Agent format
    EOS
  end
end
