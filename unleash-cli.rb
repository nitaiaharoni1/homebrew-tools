# Homebrew formula for unleash-cli
class UnleashCli < Formula
  desc "Comprehensive CLI tool for managing Unleash Cloud feature flags"
  homepage "https://github.com/nitaiaharoni1/unleash-cli"
  url "https://github.com/nitaiaharoni1/unleash-cli/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "771dbaba9c458f1c07e015ea667304b0eb4cc1a514fe98ff88919f7ebd99589a"
  license "MIT"

  depends_on "python@3.11"

  def install
    system "python3", "-m", "pip", "install", "--prefix=#{prefix}", "."
  end

  test do
    system "#{bin}/unleash", "--version"
  end
end
