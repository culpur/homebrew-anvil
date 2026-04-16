class Anvil < Formula
  desc "AI coding assistant with typed credential vault, live remote control, 5 providers"
  homepage "https://culpur.net/anvil"
  version "2.2.4"
  license "Proprietary"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.4/anvil-aarch64-apple-darwin"
      sha256 "957505bce37ae22df306d413baeb09f6af75ea0b9632d47fa7acd2140bb7d4fe"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.4/anvil-x86_64-apple-darwin"
      sha256 "placeholder"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.4/anvil-aarch64-unknown-linux-gnu"
      sha256 "placeholder"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.4/anvil-x86_64-unknown-linux-gnu"
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
