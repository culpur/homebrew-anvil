class Anvil < Formula
  desc "AI coding assistant with typed credential vault, live remote control, 5 providers"
  homepage "https://culpur.net/anvil"
  version "2.2.28"
  license "Proprietary"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.28/anvil-aarch64-apple-darwin"
      sha256 "d9fb26d8583d0331437777f4dfe5973f1a636d8c08e538491738a1ae789af9f1"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.28/anvil-x86_64-apple-darwin"
      sha256 "d46d7537fd9204806b8726585ec5c180564f82e7362f29544d70c51482666c1c"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.28/anvil-aarch64-unknown-linux-gnu"
      sha256 "f7cad4d6fedfec5319507dfca6df07c10f79ea2fc048353e1264ad895daa9d0a"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.28/anvil-x86_64-unknown-linux-gnu"
      sha256 "4dfdac13d98488695ecdd5bccd868fa21601dc3a4e448b9ee0d31997de960146"
    end
  end
  resource "manpage" do
    url "https://github.com/culpur/anvil/releases/download/v2.2.28/anvil.1"
    sha256 "d73dcf554e37109f69cb5f66c6a7e17663637d1135db66de6c13e118deb41ee9"
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
