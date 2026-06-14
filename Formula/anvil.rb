class Anvil < Formula
  desc "AI coding assistant with typed credential vault, live remote control, 5 providers"
  homepage "https://culpur.net/anvil"
  version "2.2.21"
  license "Proprietary"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.21/anvil-aarch64-apple-darwin"
      sha256 "e38457d781c97fa54613168a2d2633a4ca410393bcdee383a3dd3f7682d43e87"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.21/anvil-x86_64-apple-darwin"
      sha256 "332dd12fa688cdf76aaa379840ebbe973981876c378a07eaf5432f48ea11d6bc"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.21/anvil-aarch64-unknown-linux-gnu"
      sha256 "a1e126f6a5b9f58ca386c0492b961981ee86e65e626213845284f119b6dcf37c"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.21/anvil-x86_64-unknown-linux-gnu"
      sha256 "88dadbf5fc8920b1ba35ebde82ee886022f6ee7444946cac5c10361bbd8d5f36"
    end
  end
  resource "manpage" do
    url "https://github.com/culpur/anvil/releases/download/v2.2.21/anvil.1"
    sha256 "5f2f60995e40243beaf8184f23a712b0bc92c5ce9086cdbfebb59acd44413b90"
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
