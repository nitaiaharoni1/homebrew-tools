# Homebrew formula for unleash-cli
class UnleashCli < Formula
  desc "Comprehensive CLI tool for managing Unleash Cloud feature flags"
  homepage "https://github.com/nitaiaharoni1/unleash-cli"
  url "https://github.com/nitaiaharoni1/unleash-cli/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "b2b86e8a21ac2b888dd244e3e2f16e6f2c8aeeda20923c96fb878ee0a242892a"
  license "MIT"

  depends_on "python@3.11"

  def install
    system "python3", "-m", "pip", "install", "--prefix=#{prefix}", "."
  end

  test do
    system "#{bin}/unleash", "--version"
  end
end
