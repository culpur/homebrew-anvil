class Anvil < Formula
  desc "AI coding assistant — multi-provider, live remote control, encrypted vault"
  homepage "https://culpur.net/anvil"
  version "2.2.8"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.8/anvil-aarch64-apple-darwin"
      sha256 "ba04fb0b35874346455708d0ca921dc13ac40c9c7aefb10d907bcd56783c5c62"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.8/anvil-x86_64-apple-darwin"
      sha256 "c7ddec7358181c9653c3f3fdde6d1fb1b98be1e34de621fadc454367662b87b2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.8/anvil-aarch64-unknown-linux-gnu"
      sha256 "5ce9564bf75ec04c2d45c821bb083c4c69bf41ddb6dec13cf670ae1b3c2b155f"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.8/anvil-x86_64-unknown-linux-gnu"
      sha256 "ada6b201424caec0abd334291d02e3d33697ecac212763e89519a16cbcc29b87"
    end
  end

  def install
    downloaded = Dir["anvil-*"].first || "anvil"
    bin.install downloaded => "anvil"
  end

  test do
    assert_match "Anvil", shell_output("#{bin}/anvil --version")
  end
end
