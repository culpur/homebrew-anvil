class Anvil < Formula
  desc "AI coding assistant with live remote control — 5 providers, encrypted vault, 90+ commands"
  homepage "https://culpur.net/anvil"
  version "2.1.4"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.1.4/anvil-aarch64-apple-darwin"
      sha256 "ce70b0855eff9dcc7311f425fcf4f5b4437cf03bc2d688d449aa8c2579d66864"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.1.4/anvil-x86_64-apple-darwin"
      sha256 "b0edc1d72d641833758894bf907bdc6ee3e5845f628ab6b19e1e7cc56cf7a7aa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.1.4/anvil-aarch64-unknown-linux-gnu"
      sha256 "3605e2acd457dc77e99457afcb13ee1211fea1bc6859980a1374f597fbe412b6"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.1.4/anvil-x86_64-unknown-linux-gnu"
      sha256 "5f6b1ce081a6436e9a6a646d9577c1be2de38849a18df2b40bb5042c68ea2103"
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
