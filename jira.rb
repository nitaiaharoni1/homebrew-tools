# Homebrew formula for Enhanced Jira CLI
# Formula name: jira
# Tap: nitaiaharoni1

class Jira < Formula
  desc "Enhanced Jira CLI with attachments, comments, worklogs, history, and unwatch operations"
  homepage "https://github.com/nitaiaharoni1/jira-cli"
  url "https://github.com/nitaiaharoni1/jira-cli/archive/refs/tags/v1.7.2.tar.gz"
  version "1.7.2"
  sha256 "8c68cfd268b02aa66abfc1d22b76ac93976ac73ac8ffa8f7f5460006525794ad"
  license "MIT"
  head "https://github.com/nitaiaharoni1/jira-cli.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"jira", "./cmd/jira"
  end

  test do
    system "#{bin}/jira", "version"
  end

  def caveats
    <<~EOS
      Enhanced Jira CLI has been installed!

      To get started:
      1. Run: jira init
      2. Configure your Jira instance
      3. Then use: jira help

      New features:
      - Attachments management (upload, list, download, delete)
      - Comment management (list, edit, delete)
      - Worklog management (list, update, delete)
      - Issue history/changelog
      - Unwatch operations
      - Bulk operations (assign, move)
      - Fixed original estimate updates (v1.7.2)
    EOS
  end
end

