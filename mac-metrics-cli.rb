# Homebrew formula for Mac Metrics CLI
# Formula name: mac-metrics-cli
# Tap: nitaiaharoni1

class MacMetricsCli < Formula
  desc "Monitor your Mac's performance metrics over time with per-process attribution"
  homepage "https://github.com/nitaiaharoni1/mac-metrics-cli"
  url "https://github.com/nitaiaharoni1/mac-metrics-cli/archive/refs/tags/v1.0.2.tar.gz"
  version "1.0.2"
  sha256 "bee81d65c6f56f675c570583f6015e8cbd80c9922409d2da6f3d0103b864ae43"
  license "MIT"
  head "https://github.com/nitaiaharoni1/mac-metrics-cli.git", branch: "main"

  depends_on "bash" => :build

  def install
    bin.install "mac-monitor.sh" => "mac-monitor"
    bin.install "mac-analyze.sh" => "mac-analyze"
    bin.install "mac-monitor-cleanup.sh" => "mac-monitor-cleanup"
    bin.install "mac-monitor-status.sh" => "mac-monitor-status"
  end

  test do
    system "#{bin}/mac-monitor", "--help" || true
  end

  def caveats
    <<~EOS
      Mac Metrics CLI has been installed!

      Quick Start:
      1. Run status check:
         mac-monitor status

      2. Start monitoring (one-time):
         mac-monitor

      3. Enable automatic monitoring on startup:
         mac-monitor install-agent
         mac-monitor start

      4. View your metrics:
         mac-analyze summary
         mac-analyze trends cpu hourly

      5. Identify resource hogs:
         mac-analyze offenders

      Files are stored in: ~/logs/mac-metrics/

      Automatic cleanup is configured (30-day retention, runs Sundays 3AM)

      For more information: mac-monitor help
    EOS
  end
end