# Homebrew formula for Mac Metrics CLI
class MacMetricsCli < Formula
  desc "Monitor your Mac's performance metrics over time with per-process attribution"
  homepage "https://github.com/nitaiaharoni1/mac-metrics-cli"
  url "https://github.com/nitaiaharoni1/mac-metrics-cli/archive/refs/tags/v1.0.4.tar.gz"
  version "1.0.4"
  sha256 "5f289208d2dd1cfaaccd216b46f3ba8760afbe7ffed1fd54319c193f818408d7"
  license "MIT"

  def install
    bin.install "mac-monitor.sh" => "mac-monitor"
    bin.install "mac-analyze.sh" => "mac-analyze"
    bin.install "mac-monitor-cleanup.sh" => "mac-monitor-cleanup"
    bin.install "mac-monitor-status.sh" => "mac-monitor-status"
  end

  def caveats
    <<~EOS
      Mac Metrics CLI installed!

      Quick Start:
        mac-monitor install-agent  # Set up auto-monitoring
        mac-monitor start          # Start monitoring
        mac-analyze health         # Check system health
        mac-analyze offenders      # Find resource hogs
        mac-analyze compare 30     # Compare memory changes

      Data: ~/logs/mac-metrics/
    EOS
  end
end
