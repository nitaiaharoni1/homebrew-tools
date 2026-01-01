# Homebrew formula for Enhanced Jira CLI
# Formula name: jira
# Tap: nitaiaharoni1

class Jira < Formula
  desc "Enhanced Jira CLI with statistics, bulk operations, attachments, comments, worklogs, and more"
  homepage "https://github.com/nitaiaharoni1/jira-cli"
  url "https://github.com/nitaiaharoni1/jira-cli/archive/refs/tags/v1.8.5.tar.gz"
  version "1.8.5"
  sha256 "19a0a516db8050b10017f1195239902be92c27bb1a49d3fb01031ab68eeea831"
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

      New features in v1.8.5:
      - Fix list and move command build errors
      
      Previous fixes (v1.8.4):
      - Fix final build errors (function signatures, type fields)
      
      Previous fixes (v1.8.3):
      - Fix additional build errors (BoolVar type, unused imports)
      
      Previous fixes (v1.8.2):
      - Fix build errors (remove unused imports)
      
      Previous features (v1.8.1):
      - Add --sprint-ids flag to extract sprint IDs without requiring jq
      
      Previous features (v1.8.0):
      - Statistics and reporting (sprint, velocity, worklog, assigned)
      - Enhanced bulk operations (assign, move, watch, unwatch, comment, label)
      - Flexible output formats (json, csv, keys, table)
      - 'jira my' shortcut for assigned issues
      - Label management commands
      - Improved error handling and usability
      
      Previous features:
      - Attachments management (upload, list, download, delete)
      - Comment management (list, edit, delete)
      - Worklog management (list, update, delete)
      - Issue history/changelog
      - Unwatch operations
    EOS
  end
end

