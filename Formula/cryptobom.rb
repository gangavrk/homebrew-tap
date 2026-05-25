# cryptobom Homebrew formula (prebuilt-binary).
#
# This is a TEMPLATE. The release workflow (.github/workflows/release.yml, the
# `homebrew` job) renders the __PLACEHOLDERS__ on each tagged release and pushes
# the result to your tap repo as Formula/cryptobom.rb. To bootstrap by hand,
# replace gangavrk/CryptoBom (owner/repo), 0.1.0 (the tag without the leading "v"),
# and the three __SHA_*__ values (from the release's checksums.txt).
#
# A prebuilt binary is shipped rather than built from source because the parsers
# use tree-sitter via cgo: the binary is platform-specific and needs a C
# toolchain, so we install the artifacts already built on native CI runners.
class Cryptobom < Formula
  desc "Developer-first cryptographic discovery for the post-quantum transition"
  homepage "https://github.com/gangavrk/CryptoBom"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/gangavrk/CryptoBom/releases/download/v#{version}/cryptobom-v#{version}-darwin-arm64.tar.gz"
      sha256 "13964fb481f32259a5e6f9a6440653c9745b95cfd5398d9472849b7a2220c828"
    end
    on_intel do
      url "https://github.com/gangavrk/CryptoBom/releases/download/v#{version}/cryptobom-v#{version}-darwin-amd64.tar.gz"
      sha256 "9ce1126ac11ee1632c6e6d363efcbc264115cd37df1d30ee6f3af683add491b3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/gangavrk/CryptoBom/releases/download/v#{version}/cryptobom-v#{version}-linux-amd64.tar.gz"
      sha256 "12a0cd310c988985b7a7553e665ecbdac341766e1c1c18b26ad2b98d14324d7f"
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
