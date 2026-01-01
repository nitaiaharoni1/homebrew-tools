# Homebrew formula for Enhanced Jira CLI
# Formula name: jira
# Tap: nitaiaharoni1

class Jira < Formula
  desc "Enhanced Jira CLI with statistics, bulk operations, attachments, comments, worklogs, and more"
  homepage "https://github.com/nitaiaharoni1/jira-cli"
  url "https://github.com/nitaiaharoni1/jira-cli/archive/refs/tags/v1.8.7.tar.gz"
  version "1.8.7"
  sha256 "bd07edda7361e62f2f63cceff67dec7596c9444770887355ffdc8b41cbe8fbb5"
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

      New features in v1.8.7:
      - Fix --output csv/table flag error
      - CSV output now properly sets delimiter to comma
      - All output formats working correctly
      
      Previous fixes (v1.8.6):
      - Fix all remaining build errors
      - All tests passing
      
      Previous fixes (v1.8.5):
      - Fix list and move command build errors
      
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

