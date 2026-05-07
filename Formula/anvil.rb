class Anvil < Formula
  desc "AI coding assistant with typed credential vault, live remote control, 5 providers"
  homepage "https://culpur.net/anvil"
  version "2.2.10"
  license "Proprietary"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.10/anvil-aarch64-apple-darwin"
      sha256 "879f11bf64202600f5530aaf3c2cced96784034f13dbb0c522380972a7f9aad8"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.10/anvil-x86_64-apple-darwin"
      sha256 "89201fa3ce99146ca1cae54ad0861e3ae2ae45793dc51f14410555d2b46a55a3"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.10/anvil-aarch64-unknown-linux-gnu"
      sha256 "b3cb101e9dab7be3f122eb5c1b23a7c95fb2596443b4132b7f5e190a821fb09f"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.10/anvil-x86_64-unknown-linux-gnu"
      sha256 "2234b238c17878bccd28c9a7fcff000fab481ffa70bc9135dd1d66f71ac925d6"
    end
  end
  def install
    downloaded = Dir["anvil-*"].first || "anvil"
    bin.install downloaded => "anvil"
  end
  test do
    assert_match "Anvil CLI", shell_output("#{bin}/anvil --version")
  end
end
