# Homebrew formula for Web Scraper CLI
# Formula name: webscraper-cli
# Tap: nitaiaharoni1/tools

class WebscraperCli < Formula
  desc "Powerful CLI tool for website scraping, automation, and crawling using Playwright"
  homepage "https://github.com/nitaiaharoni1/webscraper-cli"
  url "https://github.com/nitaiaharoni1/webscraper-cli/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "fd72ffbf695686e902b8d653cc7a22a95d2ba54266231d3045c28341b4f39bf4"
  license "MIT"
  head "https://github.com/nitaiaharoni1/webscraper-cli.git", branch: "main"

  depends_on "python@3.11"

  def install
    # Install Python dependencies
    system "pip3", "install", "--upgrade", "pip", "setuptools", "wheel"
    system "pip3", "install", "-r", "requirements.txt"
    
    # Install Playwright browsers
    system "python3", "-m", "playwright", "install", "chromium"
    
    # Install all Python modules and CLI script
    libexec.install Dir["*"]
    
    # Create wrapper script that sets PYTHONPATH correctly
    (bin/"webscraper").write <<~PYTHON
      #!/usr/bin/env python3
      import sys
      import os
      
      # Add libexec to Python path
      libexec_path = os.path.join(os.path.dirname(__file__), "..", "libexec")
      libexec_path = os.path.abspath(libexec_path)
      sys.path.insert(0, libexec_path)
      
      # Import and run CLI
      from cli import app
      app()
    PYTHON
    chmod 0755, bin/"webscraper"
  end

  test do
    # Test that the CLI exists and shows help
    assert_match "web scraping", shell_output("#{bin}/webscraper --help 2>&1", 0)
  end

  def caveats
    <<~EOS
      Web Scraper CLI has been installed!

      To get started:
      1. Run: webscraper --help
      2. Navigate to a page: webscraper goto "https://example.com"
      3. Extract data: webscraper text "h1" --url "https://example.com"

      Features:
      - 125+ commands for web automation
      - Browser stays open by default (headed mode)
      - Supports headless mode for automation
      - Batch operations and parallel processing
      - Video recording, screenshots, and more

      See README.md for full documentation:
      https://github.com/nitaiaharoni1/webscraper-cli
    EOS
  end
end
