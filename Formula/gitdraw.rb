class Gitdraw < Formula
  desc "Draw text and art on your GitHub contribution graph"
  homepage "https://github.com/1etu/gitdraw"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1etu/gitdraw/releases/download/v#{version}/gitdraw-cli-macos-arm64.zip"
      sha256 "155c696fd9de01a8aaa1d58378c1465eb0a10ccee1f87ea79999a5c241544083"
    end
    on_intel do
      url "https://github.com/1etu/gitdraw/releases/download/v#{version}/gitdraw-cli-macos-amd64.zip"
      sha256 "a2dabebf2256eae9d15ab86a1e096c3899a380fd15ec9e5a19cea5ecf4650aed"
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
    assert_match "gitdraw", shell_output("#{bin}/gitdraw --version")
  end
end
