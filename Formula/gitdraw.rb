class Gitdraw < Formula
  desc "Draw text and art on your GitHub contribution graph"
  homepage "https://github.com/1etu/gitdraw"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1etu/gitdraw/releases/download/v#{version}/gitdraw-cli-macos-arm64.zip"
      sha256 "9a166b61adada48c9c9a5b223ed94f38b2bf26ec54bc011441156cdb3625004e"
    end
    on_intel do
      url "https://github.com/1etu/gitdraw/releases/download/v#{version}/gitdraw-cli-macos-amd64.zip"
      sha256 "83ba4ca0c5c77be7ede8a3e4143acdd7410faa0a907d09c0a4c8f14b737bb76f"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "gitdraw-cli-macos-arm64" => "gitdraw"
    else
      bin.install "gitdraw-cli-macos-amd64" => "gitdraw"
    end
  end

  test do
    assert_match "gitdraw", shell_output("#{bin}/gitdraw --help")
  end
end
