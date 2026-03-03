# Homebrew formula for MCP Reddit
# Formula name: mcp-reddit
# Tap: nitaiaharoni1/tools

class McpReddit < Formula
  desc "Model Context Protocol (MCP) server for Reddit API integration with AI assistants"
  homepage "https://github.com/nitaiaharoni1/reddit-mcp"
  url "https://registry.npmjs.org/mcp-reddit/-/mcp-reddit-1.1.8.tgz"
  sha256 "4368082df3488c0bda868e2e4e81a63a0a03c3e6fa5324287cc49df61b097aa8"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
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
