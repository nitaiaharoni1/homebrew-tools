# Homebrew formula for ast-scan
# Formula name: ast-scan
# Tap: nitaiaharoni1/tools

class AstScan < Formula
  desc "AST-based codebase health scanner for Python, TypeScript, and Rust"
  homepage "https://github.com/nitaiaharoni1/ast-scan"
  url "https://github.com/nitaiaharoni1/ast-scan/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "dec433f559a3a9ae1c935f16d4fb0ffbf791f0815a6c3729ef44146b984c5f6a"
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
        ast-scan <path> --max-complexity 20 --max-nesting 6  # threshold checks

      Examples:
        ast-scan .                        # scan current directory
        ast-scan src/ --typescript --json
        ast-scan . --exclude node_modules --exclude dist

      Full docs: https://github.com/nitaiaharoni1/ast-scan
    EOS
  end
end
