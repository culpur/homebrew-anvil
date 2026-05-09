class Anvil < Formula
  desc "AI coding assistant with typed credential vault, live remote control, 5 providers"
  homepage "https://culpur.net/anvil"
  version "2.2.11"
  license "Proprietary"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.11/anvil-aarch64-apple-darwin"
      sha256 "480537c8110b90ab938efb8d2a60e09a8f85988cea653e35583c27bff72cbab3"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.11/anvil-x86_64-apple-darwin"
      sha256 "6532017c25b54ee5f5e6c78a06a5b328839e50cff8686a034ee94cb83ba0df05"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.11/anvil-aarch64-unknown-linux-gnu"
      sha256 "e57d617b43678145d5ce1fc788a1f2044000bb7030493d844459dc05382a6c1b"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.11/anvil-x86_64-unknown-linux-gnu"
      sha256 "75fde34309c5c0b34e457a57fe848b49697fd4caf6e8e80ee19e7667dfb1e6ce"
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
