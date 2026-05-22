class Anvil < Formula
  desc "AI coding assistant — multi-provider, live remote control, encrypted vault"
  homepage "https://culpur.net/anvil"
  version "2.2.19"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.19/anvil-aarch64-apple-darwin"
      sha256 "3caa2b8f5533ca78306feb7f9c3812cdc8cec2d7007dca2808e78846538cdd64"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.19/anvil-x86_64-apple-darwin"
      sha256 "eb442f3ad899b60d9f0200dfa57ce1ff044cbdc9696013907ca13d90b609103f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.19/anvil-aarch64-unknown-linux-gnu"
      sha256 "56fc136bf6e73fe01b19c29f652b5777bad28fdcb3b204b1b60d5f1b67c24ef2"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.19/anvil-x86_64-unknown-linux-gnu"
      sha256 "6f53edc005ac204b8f5e81cb8807415d0dde8891530254d1fde4ee892320d8c0"
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
