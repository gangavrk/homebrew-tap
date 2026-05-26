# cryptobom Homebrew formula (prebuilt binary), generated from a template.
#
# Don't edit this file in the tap by hand: the release workflow
# (.github/workflows/release.yml, the `homebrew` job) regenerates it on every
# tagged release -- filling in the repo, version, and per-platform sha256 -- and
# commits it here. To change it, edit the template at
# packaging/homebrew/cryptobom.rb in the main repo.
#
# A prebuilt binary is shipped rather than built from source because the parsers
# use tree-sitter via cgo: the binary is platform-specific and needs a C
# toolchain, so we install the artifacts already built on native CI runners.
class Cryptobom < Formula
  desc "Developer-first cryptographic discovery for the post-quantum transition"
  homepage "https://github.com/gangavrk/CryptoBom"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/gangavrk/CryptoBom/releases/download/v#{version}/cryptobom-v#{version}-darwin-arm64.tar.gz"
      sha256 "d30245156add3766e369e7ea1a3dbd1f642d5bf1bf637fe8daad45203f461ced"
    end
    on_intel do
      url "https://github.com/gangavrk/CryptoBom/releases/download/v#{version}/cryptobom-v#{version}-darwin-amd64.tar.gz"
      sha256 "714307e90927305297a8f4ab300c36eb7c9e8dfed957a2e50ac7748611ece7ef"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/gangavrk/CryptoBom/releases/download/v#{version}/cryptobom-v#{version}-linux-amd64.tar.gz"
      sha256 "3642c3bebd1322e83676c4b164d724d92959b1bc113d4bf8008337427d7284d0"
    end
  end

  def install
    # The release tarball contains a single top-level directory, which Homebrew
    # unpacks into; the binary sits at its root next to LICENSE and README.md.
    bin.install "cryptobom"
  end

  test do
    assert_match "cryptobom v#{version}", shell_output("#{bin}/cryptobom version")
  end
end
