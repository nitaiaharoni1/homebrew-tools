# Homebrew formula for unleash-cli
class UnleashCli < Formula
  desc "Comprehensive CLI tool for managing Unleash Cloud feature flags"
  homepage "https://github.com/nitaiaharoni1/unleash-cli"
  url "https://github.com/nitaiaharoni1/unleash-cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "60f67a298834363903137b9271f536482753c204e2666f7983c8c0de3a0a859d"
  license "MIT"

  depends_on "python@3.11"

  def install
    system "python3", "-m", "pip", "install", "--prefix=#{prefix}", "."
  end

  test do
    system "#{bin}/unleash", "--version"
  end
end
