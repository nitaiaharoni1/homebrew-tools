# Homebrew formula for Web Scraper CLI
# Formula name: webscraper-cli
# Tap: nitaiaharoni1/tools

class WebscraperCli < Formula
  desc "Powerful CLI tool for website scraping, automation, and crawling using Playwright"
  homepage "https://github.com/nitaiaharoni1/webscraper-cli"
  url "https://github.com/nitaiaharoni1/webscraper-cli/archive/refs/tags/v2.5.0.tar.gz"
  sha256 "11577adfc1d2812897b67a066b239b06e9329811c49033be3a3f7eecf17960b3"
  license "MIT"
  head "https://github.com/nitaiaharoni1/webscraper-cli.git", branch: "main"

  depends_on "python@3.11"

  def install
    # Find the extracted directory (buildpath might be parent directory)
    subdir = buildpath/"webscraper-cli-2.5.0"
    extracted_dir = if subdir.exist?
      subdir
    else
      buildpath
    end

    cd extracted_dir.to_s do
      # Install Python dependencies
      system "pip3", "install", "--upgrade", "pip", "setuptools", "wheel"
      system "pip3", "install", "-r", "requirements.txt"

      # Install Playwright browsers
      system "python3", "-m", "playwright", "install", "chromium"

      # Install all Python modules and CLI script to libexec
      libexec.install Dir["*"]
    end

    # Create wrapper script that sets PYTHONPATH correctly
    wrapper = bin/"webscraper"
    wrapper.write <<~PYTHON
      #!/usr/bin/env python3
      import sys
      import os

      # Resolve symlinks to get the real path
      real_path = os.path.realpath(__file__)

      # Add libexec to Python path so imports work
      libexec_path = os.path.join(os.path.dirname(real_path), "..", "libexec")
      libexec_path = os.path.abspath(libexec_path)
      if libexec_path not in sys.path:
          sys.path.insert(0, libexec_path)

      # Change to libexec directory so relative imports work
      os.chdir(libexec_path)

      # Execute cli.py directly
      cli_path = os.path.join(libexec_path, "cli.py")
      if os.path.exists(cli_path):
          exec(open(cli_path).read())
      else:
          print(f"Error: cli.py not found at {cli_path}", file=sys.stderr)
          sys.exit(1)
    PYTHON
    wrapper.chmod 0755
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

      New in v2.5.0:
      - Fix: fill-form now finds textarea fields by id and placeholder attributes
      - Fix: fill-form uses get_by_label fallback for hidden checkboxes and radio inputs

      See README.md for full documentation:
      https://github.com/nitaiaharoni1/webscraper-cli
    EOS
  end
end
