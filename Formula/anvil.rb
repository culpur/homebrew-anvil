class Anvil < Formula
  desc "AI coding assistant with typed credential vault, live remote control, 5 providers"
  homepage "https://culpur.net/anvil"
  version "2.2.26"
  license "Proprietary"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.26/anvil-aarch64-apple-darwin"
      sha256 "e306ad0202d44e7b750e073565501b7a69804034d515fc596fa010e39b6ba382"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.26/anvil-x86_64-apple-darwin"
      sha256 "c76190333d9e913fc58584316d66143a2b9c4e879d72fa69e4805079d3300947"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.26/anvil-aarch64-unknown-linux-gnu"
      sha256 "57430ca5abf931d0f03819841413135e8a04b02b943ae3ede54b237f1ab4ad91"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.26/anvil-x86_64-unknown-linux-gnu"
      sha256 "b25e3d9111a32bcd14f9301b5b597053b57133af69dc234644e4cba08c8a2d74"
    end
  end
  resource "manpage" do
    url "https://github.com/culpur/anvil/releases/download/v2.2.26/anvil.1"
    sha256 "1bec67019f8a357bbea1217ed8121aa37bb63aea021bba0a0666013f0d0308db"
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
