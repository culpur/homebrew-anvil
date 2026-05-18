class Anvil < Formula
  desc "AI coding assistant with typed credential vault, live remote control, 5 providers"
  homepage "https://culpur.net/anvil"
  version "2.2.17"
  license "Proprietary"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.17/anvil-aarch64-apple-darwin"
      sha256 "e1b66f8c6bb88ea0deaaa8b238e05896066560acb35cd6654c572a9b203d7ccb"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.17/anvil-x86_64-apple-darwin"
      sha256 "5450b5c0d0d645a4da6a175d57dc762085fad85d14a607f7ec40bc0342636da9"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.17/anvil-aarch64-unknown-linux-gnu"
      sha256 "3de21a630defa8898231fdc1fae4d14e5e00e7907ba0ba789f046c722d4e6ade"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.17/anvil-x86_64-unknown-linux-gnu"
      sha256 "837e2e9f7ffca4463fefbca4035fcc23712c9af8f80c9e4ac66a35c6e89ade3d"
    end
  end
  resource "manpage" do
    url "https://github.com/culpur/anvil/releases/download/v2.2.17/anvil.1"
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
