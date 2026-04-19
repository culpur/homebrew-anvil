class Anvil < Formula
  desc "AI coding assistant with typed credential vault, live remote control, 5 providers"
  homepage "https://culpur.net/anvil"
  version "2.2.5"
  license "Proprietary"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.5/anvil-aarch64-apple-darwin"
      sha256 "a4c16e71061450e158cec297e8dd1579bda2a01a9c939619658658bde5c13a2b"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.5/anvil-x86_64-apple-darwin"
      sha256 "placeholder"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.5/anvil-aarch64-unknown-linux-gnu"
      sha256 "placeholder"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.5/anvil-x86_64-unknown-linux-gnu"
      sha256 "placeholder"
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
