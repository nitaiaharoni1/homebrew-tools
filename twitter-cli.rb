# Homebrew formula for Twitter CLI
# Formula name: twitter-cli
# Tap: nitaiaharoni1/tools

class TwitterCli < Formula
  desc "Command-line interface for the Twitter (X) API v2"
  homepage "https://github.com/nitaiaharoni1/twitter-cli"
  url "https://github.com/nitaiaharoni1/twitter-cli/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "ab2993c6453957735039172fe50f69196b150352decdb8dd4e0b16f236fc72e7"
  license "MIT"
  head "https://github.com/nitaiaharoni1/twitter-cli.git", branch: "main"

  depends_on "node"

  def install
    # Build the fully self-contained bundle (bundles all JS deps via esbuild)
    system "npm", "install", "--ignore-scripts"
    system "node", "build.js"

    # Install the single bundled file into libexec
    libexec.install "dist/cli.js"
    libexec.install "dist/package.json"
    libexec.install "README.md" if File.exist?("README.md")
    libexec.install "LICENSE" if File.exist?("LICENSE")

    # Create a thin wrapper so `twitter-cli` is on PATH
    (bin/"twitter-cli").write <<~SH
      #!/bin/bash
      exec node "#{libexec}/cli.js" "$@"
    SH
    chmod 0755, bin/"twitter-cli"
  end

  test do
    assert_match "1.1.1", shell_output("#{bin}/twitter-cli --version")
    assert_match "twitter-cli", shell_output("#{bin}/twitter-cli --help")
  end

  def caveats
    <<~EOS
      Twitter CLI has been installed!

      Quick start:

      1. Set your API credentials (stored in ~/.twitter-cli/config.json):

           twitter-cli auth set \\
             --bearer-token  YOUR_BEARER_TOKEN \\
             --api-key       YOUR_API_KEY \\
             --api-secret    YOUR_API_SECRET \\
             --access-token  YOUR_ACCESS_TOKEN \\
             --access-secret YOUR_ACCESS_SECRET

      2. Verify credentials:
           twitter-cli auth show
           twitter-cli usage info

      3. Read tweets:
           twitter-cli tweet get 20
           twitter-cli tweet get-many 20 1234567890   # batch — cheaper!
           twitter-cli tweet timeline twitter -n 20
           twitter-cli tweet mentions elonmusk
           twitter-cli user info twitter
           twitter-cli user whoami

      4. Write tweets (requires --access-token + --access-secret):
           twitter-cli post tweet "Hello from twitter-cli!"
           twitter-cli post like 20
           twitter-cli post retweet 20

      5. Track usage & costs:
           twitter-cli usage stats
           twitter-cli usage cache

      Cost-saving features built in:
        • 24h dedup cache — repeat reads within the same UTC day cost $0
        • Batch fetching  — tweet get-many sends up to 100 IDs per API call
        • Expansion cache — author users from timelines cached for free

      Get API keys at: https://developer.twitter.com/en/portal/dashboard
      Full docs: https://github.com/nitaiaharoni1/twitter-cli
    EOS
  end
end
