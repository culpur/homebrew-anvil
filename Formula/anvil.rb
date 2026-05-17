class Anvil < Formula
  desc "AI coding assistant with typed credential vault, live remote control, 5 providers"
  homepage "https://culpur.net/anvil"
  version "2.2.16"
  license "Proprietary"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.16/anvil-aarch64-apple-darwin"
      sha256 "5f39af7d7dd054ce7ca8d1371b8aab8df84ad281bf7c5ffa61c981dba9631626"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.16/anvil-x86_64-apple-darwin"
      sha256 "995c83b194a845e9460f6147d95fcd003f71056e8b5808bf5e30d707c7e5b2d6"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.16/anvil-aarch64-unknown-linux-gnu"
      sha256 "755c3c8dfa0ce59ddab7247de4201df4490c80a65e64228f262f66a207f68e05"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.16/anvil-x86_64-unknown-linux-gnu"
      sha256 "2193cd94c6d1a478b7819b4684085ebac90b32b9a90a81e127bf9ce5357a751c"
    end
  end
  resource "manpage" do
    url "https://github.com/culpur/anvil/releases/download/v2.2.16/anvil.1"
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
