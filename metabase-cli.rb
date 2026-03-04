# Homebrew formula for Metabase CLI
# Formula name: metabase-cli
# Tap: nitaiaharoni1/tools

class MetabaseCli < Formula
  desc "CLI for Metabase: start containers, export dashboards to JSON"
  homepage "https://github.com/nitaiaharoni1/metabase-cli"
  url "https://github.com/nitaiaharoni1/metabase-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "a944d79b58a44142dd1522bbe1b2d8ae9ec1cddcd0863a73d9ead637fc527236"
  license "MIT"
  head "https://github.com/nitaiaharoni1/metabase-cli.git", branch: "main"

  depends_on "python@3.11"

  def install
    system "python3.11", "-m", "pip", "install", "--prefix=#{prefix}", "."
  end

  test do
    assert_match "start", shell_output("#{bin}/metabase-cli --help 2>&1")
  end

  def caveats
    <<~EOS
      Metabase CLI has been installed!

      To get started:
      1. Start Metabase: metabase-cli start -c 'docker compose up -d --wait postgres metabase' -p 30001
      2. Add database: metabase-cli database add -f metabase-dashboards/database.yaml --url http://localhost:30003
      3. Configure from YAML: metabase-cli configure -f metabase-dashboards/opensketch.yaml --url http://localhost:30003
      4. Export dashboards: metabase-cli export -o metabase-export --url http://localhost:30001
      5. Export to YAML (dashboards as code): metabase-cli export --to-code -o metabase-dashboards/opensketch.yaml -d "Overview,Tool Usage,..." --url http://localhost:30003

      Credentials: ~/.metabase.env or .env.metabase (METABASE_EMAIL, METABASE_PASSWORD)
      See: https://github.com/nitaiaharoni1/metabase-cli
    EOS
  end
end
