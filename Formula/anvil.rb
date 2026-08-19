class Anvil < Formula
  desc "AI coding assistant with typed credential vault, live remote control, 5 providers"
  homepage "https://culpur.net/anvil"
  version "2.2.30"
  license "Proprietary"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.30/anvil-aarch64-apple-darwin"
      sha256 "ccefc3e47ee3e5d19f49e160d1d085d6950b462b4ad3344adf91fe00fd2dceb3"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.30/anvil-x86_64-apple-darwin"
      sha256 "c9b683533077c1f952752f75220864d9008e6d9abd4cb5e4048ce89997e4b1a9"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.30/anvil-aarch64-unknown-linux-gnu"
      sha256 "56d5c63fe15188098f5e9be54ab3009e133260fb56f167f2be695c47430e1e6a"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.30/anvil-x86_64-unknown-linux-gnu"
      sha256 "9b98d5eb82570b50d24b279b6ee81478338533a52143b5e74bc71f5275c1c3ab"
    end
  end
  resource "manpage" do
    url "https://github.com/culpur/anvil/releases/download/v2.2.30/anvil.1"
    sha256 "2eec176fe47971d4bd98bb27ef32fcaf570c1e31a68d721a11e3a3b0e7ef8a8f"
  end
  def install
    downloaded = Dir["anvil-*"].first || "anvil"
    bin.install downloaded => "anvil"
    resource("manpage").stage { man1.install "anvil.1" }
  end
  test do
    assert_match "Anvil CLI", shell_output("#{bin}/anvil --version")
  end
end
