class Anvil < Formula
  desc "AI coding assistant with typed credential vault, live remote control, 5 providers"
  homepage "https://culpur.net/anvil"
  version "2.2.18"
  license "Proprietary"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.18/anvil-aarch64-apple-darwin"
      sha256 "6e660291c506b229c1ca1438c02758a20f5f6e4963448420b8abada94a8ff13d"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.18/anvil-x86_64-apple-darwin"
      sha256 "926bc5128fbaeb5cb8ad0dfcc5f8d36cc83475b509a6116505c51129fce8edaa"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.18/anvil-aarch64-unknown-linux-gnu"
      sha256 "d513cfff4b107d93c14d103ab9eeccb6b0514d283ee5f42deca78ec01b0168e0"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.18/anvil-x86_64-unknown-linux-gnu"
      sha256 "4d1679b96bedbdc85f96d855641d6f83f4d214763d12e4b37ec636e57ff367d6"
    end
  end
  resource "manpage" do
    url "https://github.com/culpur/anvil/releases/download/v2.2.18/anvil.1"
    sha256 "710ee6b1640cf31fb5900b6bd1e1d9bb051ec1d290e3f2a10d632b9ed8c91227"
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
