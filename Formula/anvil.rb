class Anvil < Formula
  desc "AI coding assistant with live remote control — 5 providers, encrypted vault, 90+ commands"
  homepage "https://culpur.net/anvil"
  version "2.1.3"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.1.3/anvil-aarch64-apple-darwin"
      sha256 "24ab89c58130ca8ba3fb7b1b124bfb4d7484b20b4f85e25b3ddc893bb69a5190"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.1.3/anvil-x86_64-apple-darwin"
      sha256 "2e6e3646152024dd789630c085a4d5177ce007e2681efa0a6c61cc7b2fdd8c72"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.1.3/anvil-aarch64-unknown-linux-gnu"
      sha256 "f84e996df90c048905cba19ec3f6ca43508ad282b8553beb7e930b9d4e8ec7f3"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.1.3/anvil-x86_64-unknown-linux-gnu"
      sha256 "a5d0049d2a1c3c0479bc3b2dc01d75e3bca4680d09dcbcc1af6bf2d4822b2086"
    end
  end

  def install
    downloaded = Dir["anvil-*"].first || "anvil"
    bin.install downloaded => "anvil"
  end

  test do
    assert_match "Anvil CLI", shell_output("#{bin}/anvil --version")
  end
end
