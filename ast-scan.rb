# Homebrew formula for ast-scan
# Formula name: ast-scan
# Tap: nitaiaharoni1/tools

class AstScan < Formula
  desc "AST-based codebase health scanner for Python, TypeScript, and Rust"
  homepage "https://github.com/nitaiaharoni1/ast-scan"
  url "https://github.com/nitaiaharoni1/ast-scan/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "a801884b68993e715110f65f03f9d7838a6d75b72239661071bca1c769dc3410"
  license "MIT"
  head "https://github.com/nitaiaharoni1/ast-scan.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--manifest-path=rust/Cargo.toml", "--release"
    bin.install "target/release/ast-scan"
  end

  test do
    assert_match "ast-scan", shell_output("#{bin}/ast-scan --help 2>&1")
  end

  def caveats
    <<~EOS
      ast-scan has been installed!

      Usage:
        ast-scan <path>                   # auto-detect Python / TypeScript / Rust
        ast-scan <path> --python          # Python only
        ast-scan <path> --typescript      # TypeScript / JS only
        ast-scan <path> --rust            # Rust only
        ast-scan <path> --json            # JSON output
        ast-scan <path> --max-complexity 20 --max-depth 6  # threshold checks

      Examples:
        ast-scan .                        # scan current directory
        ast-scan src/ --typescript --json
        ast-scan . --exclude node_modules --exclude dist

      Full docs: https://github.com/nitaiaharoni1/ast-scan
    EOS
  end
end
