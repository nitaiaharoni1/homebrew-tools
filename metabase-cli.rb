# Homebrew formula for Metabase CLI
# Formula name: metabase-cli
# Tap: nitaiaharoni1/tools

class MetabaseCli < Formula
  desc "CLI for Metabase: start containers, export dashboards, configure from YAML"
  homepage "https://github.com/nitaiaharoni1/metabase-cli"
  url "https://github.com/nitaiaharoni1/metabase-cli/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "685726736871caf6fab170e2df7a2f6d3499def008b03ffabadcfe8f028312b7"
  license "MIT"
  head "https://github.com/nitaiaharoni1/metabase-cli.git", branch: "main"

  depends_on "python@3.11"

  def install
    # GitHub archive extracts to metabase-cli-<tag>/ subdir
    extracted = (buildpath/"metabase-cli-0.2.1").directory? ? buildpath/"metabase-cli-0.2.1" : buildpath
    cd extracted.to_s do
      system "python3.11", "-m", "pip", "install", "--prefix=#{prefix}", "."
    end
  end

  test do
    assert_match "configure", shell_output("#{bin}/metabase-cli --help 2>&1")
  end

  def caveats
    <<~EOS
      Metabase CLI has been installed!

      To get started:
      1. Start Metabase: metabase-cli start -c 'docker compose up -d --wait postgres metabase' -p 30001
      2. Export dashboards: metabase-cli export -o metabase-dashboards --url http://localhost:30001
      3. Configure from YAML: metabase-cli configure -f metabase-dashboards/tesse.yaml --url http://localhost:30002
      4. Cleanup duplicates: metabase-cli cleanup-duplicates --collection Tesse
      5. Archive dashboard: metabase-cli archive "E-commerce Insights"
      6. Archive sample cards: metabase-cli archive-cards --database-id 1

      Credentials: ~/.metabase.env or .env.metabase (METABASE_EMAIL, METABASE_PASSWORD)
      See: https://github.com/nitaiaharoni1/metabase-cli
    EOS
  end
end
