class Anvil < Formula
  desc "AI coding assistant with typed credential vault, live remote control, 5 providers"
  homepage "https://culpur.net/anvil"
  version "2.2.24"
  license "Proprietary"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.24/anvil-aarch64-apple-darwin"
      sha256 "0445c2451265fe138cbd3d916b8acdf70390cd1750ccacf235509c8b37006a6d"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.24/anvil-x86_64-apple-darwin"
      sha256 "cca2bb781be686b0c86366e84b84a689b58c373b3c15def57306f41cd6b9a3a7"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.24/anvil-aarch64-unknown-linux-gnu"
      sha256 "8da0f078d4c85b05a1217c18f633e024b55085cac77ba47da8a515dbe9f21b7f"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.24/anvil-x86_64-unknown-linux-gnu"
      sha256 "f211dc5abf7806cb83b40f9a6288157ebd242ae491f21264d0593c1d4d1762c1"
    end
  end
  resource "manpage" do
    url "https://github.com/culpur/anvil/releases/download/v2.2.24/anvil.1"
    sha256 "e13656d53942dba28fbe97d6413735f9c32204c18570db4ef19f79679eb62e12"
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
