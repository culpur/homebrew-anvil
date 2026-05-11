class Anvil < Formula
  desc "AI coding assistant — multi-provider, live remote control, encrypted vault"
  homepage "https://culpur.net/anvil"
  version "2.2.12"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.12/anvil-aarch64-apple-darwin"
      sha256 "41a9952532d390dc1610df83c72b16bbde4f1e49ed5717da972a5565fe4db251"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.12/anvil-x86_64-apple-darwin"
      sha256 "c999671e2269fecd903efcf247b2ab0b07a84bdc9a92a4a4934a3db2f071a556"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.12/anvil-aarch64-unknown-linux-gnu"
      sha256 "d0d5afb9f423bc581ebfc57afa15202f5226fe8a6061d564a95cd9d599087c18"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.12/anvil-x86_64-unknown-linux-gnu"
      sha256 "5992a3a237935b72cf5a86241a9a4d0cb62c01dd27c3c26b90b513370b3b5bb6"
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
