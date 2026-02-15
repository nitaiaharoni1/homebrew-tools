# Homebrew formula for Mac Metrics CLI
class MacMetricsCli < Formula
  desc "Monitor your Mac's performance metrics over time with per-process attribution"
  homepage "https://github.com/nitaiaharoni1/mac-metrics-cli"
  url "https://github.com/nitaiaharoni1/mac-metrics-cli/archive/refs/tags/v1.0.3.tar.gz"
  version "1.0.3"
  sha256 "c79b6ef5b0e9cc0e02adbd1660b6969068854b5cb56c6ce60cd0cd747e954752"
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
        mac-monitor status         # Check status
        mac-analyze summary        # View metrics
        mac-analyze offenders      # Find resource hogs

      Data: ~/logs/mac-metrics/
    EOS
  end
end
