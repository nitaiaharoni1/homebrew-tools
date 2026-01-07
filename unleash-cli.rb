# Homebrew formula for unleash-cli
class UnleashCli < Formula
  desc "Comprehensive CLI tool for managing Unleash Cloud feature flags"
  homepage "https://github.com/nitaiaharoni1/unleash-cli"
  url "https://github.com/nitaiaharoni1/unleash-cli/archive/v0.1.0.tar.gz"
  sha256 "d5d7f3d2cdb80de5b26bbdccf1d8fe2969f7afc0bae2a3bf416a51bd483c298c"
  license "MIT"

  depends_on "python@3.11"

  def install
    system "python3", "-m", "pip", "install", "--prefix=#{prefix}", "."
  end

  test do
    system "#{bin}/unleash", "--version"
  end
end

