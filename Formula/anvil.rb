class Anvil < Formula
  desc "AI coding assistant with typed credential vault, live remote control, 5 providers"
  homepage "https://culpur.net/anvil"
  version "2.2.31"
  license "Proprietary"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.31/anvil-aarch64-apple-darwin"
      sha256 "4a1e1d8e61c1861e37c2c525a5534090c7f9424c3cf0036c2aeda5cbde792bb4"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.31/anvil-x86_64-apple-darwin"
      sha256 "50afacccd16b17f6f92b2ab090aab0252f2500eacd37cb3f1391eedaf83ccdc8"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.31/anvil-aarch64-unknown-linux-gnu"
      sha256 "57df6b2ea612c4916a0ad53727cb17f70e77e4b28f96994239f69a917c6dd5bc"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.31/anvil-x86_64-unknown-linux-gnu"
      sha256 "24301ec209c855a8dcba40be49dc936267a0d59ed5bd974892b8d12d903dbd49"
    end
  end
  resource "manpage" do
    url "https://github.com/culpur/anvil/releases/download/v2.2.31/anvil.1"
    sha256 "2c50830ce1e3306064c3af4a5b3da5d3c1aa6665904a88514a784b5ec9592c81"
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
