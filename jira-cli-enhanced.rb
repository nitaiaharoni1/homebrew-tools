# Homebrew formula for Enhanced Jira CLI
# Formula name: jira-cli-enhanced
# Tap: nitaiaharoni1

class JiraCliEnhanced < Formula
  desc "Enhanced Jira CLI with attachments, comments, worklogs, history, and unwatch operations"
  homepage "https://github.com/nitaiaharoni1/jira-cli-enhanced"
  url "https://github.com/nitaiaharoni1/jira-cli-enhanced/archive/refs/tags/v1.7.1.tar.gz"
  version "1.7.1"
  sha256 "" # Will be calculated after release
  license "MIT"
  head "https://github.com/nitaiaharoni1/jira-cli-enhanced.git", branch: "main"

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
    EOS
  end
end

