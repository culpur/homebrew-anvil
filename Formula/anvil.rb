class Anvil < Formula
  desc "AI coding assistant with live remote control — 5 providers, encrypted vault, 90+ commands"
  homepage "https://culpur.net/anvil"
  version "2.1.4"
  license "Proprietary"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.1.4/anvil-aarch64-apple-darwin"
      sha256 "63845f7856c2747252d5230bbf8e5e26544a7881806926e1efe3adbb25d0182e"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.1.4/anvil-x86_64-apple-darwin"
      sha256 "93de87e30c649e7700646f2b79a0b107088f521235d1f907360e0dbe7ff11730"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.1.4/anvil-aarch64-unknown-linux-gnu"
      sha256 "cdc846769d8ff7a61355a18a885ad5fb3c90f2181d09c9d26e1f548e307868b0"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.1.4/anvil-x86_64-unknown-linux-gnu"
      sha256 "704491a2ca435e262108c3129eecbe04472f2478a14c6fdc03a908d4820c4af1"
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
