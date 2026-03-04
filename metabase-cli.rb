# Homebrew formula for Metabase CLI
# Formula name: metabase-cli
# Tap: nitaiaharoni1/tools

class MetabaseCli < Formula
  desc "CLI for Metabase: start containers, export dashboards to JSON"
  homepage "https://github.com/nitaiaharoni1/metabase-cli"
  url "https://github.com/nitaiaharoni1/metabase-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
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
      2. Export dashboards: metabase-cli export -o metabase-dashboards --url http://localhost:30001

      Credentials: ~/.metabase.env or .env.metabase (METABASE_EMAIL, METABASE_PASSWORD)
      See: https://github.com/nitaiaharoni1/metabase-cli
    EOS
  end
end
