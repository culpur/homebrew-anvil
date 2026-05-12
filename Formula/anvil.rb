class Anvil < Formula
  desc "AI coding assistant with typed credential vault, live remote control, 5 providers"
  homepage "https://culpur.net/anvil"
  version "2.2.14"
  license "Proprietary"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.14/anvil-aarch64-apple-darwin"
      sha256 "40ad4a06157d4c561e1ccd42e1a231023f61db35516b114da271c301a887b695"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.14/anvil-x86_64-apple-darwin"
      sha256 "f1d758d94f508948139d22337b0b8d95aff8a676725abc5f5a34b83eee6c8b3c"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.14/anvil-aarch64-unknown-linux-gnu"
      sha256 "6711948426ebba9b45e30473bc5cd77a4048fc318424daf178199f11ca4cb08d"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.14/anvil-x86_64-unknown-linux-gnu"
      sha256 "738fd3603eb1568fda033c2d34687f3073a08f674585dafc62c04230dd14e553"
    end
  end
  resource "manpage" do
    url "https://github.com/culpur/anvil/releases/download/v2.2.14/anvil.1"
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
