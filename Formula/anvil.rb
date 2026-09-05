class Anvil < Formula
  desc "AI coding assistant with typed credential vault, live remote control, 5 providers"
  homepage "https://culpur.net/anvil"
  version "2.2.32"
  license "Proprietary"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.32/anvil-aarch64-apple-darwin"
      sha256 "5d011ae3c0197a719e08cfe469d5657c763633e06be9925c0992e3e7be3b8ded"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.32/anvil-x86_64-apple-darwin"
      sha256 "e83bfdebdce0c8c1b261ad1e22f7dbaf7f2dc85853a3e3d9d438bf3487360dbc"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.32/anvil-aarch64-unknown-linux-gnu"
      sha256 "93f631d968b0ea3d4b37a7884528f3fab611b5b02d1f7d71cd11e4e6955c25a6"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.32/anvil-x86_64-unknown-linux-gnu"
      sha256 "64e2b036faed6c96f3fbdc89506d19e060f308bafd81457522c1b29f57cd4c84"
    end
  end
  resource "manpage" do
    url "https://github.com/culpur/anvil/releases/download/v2.2.32/anvil.1"
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
