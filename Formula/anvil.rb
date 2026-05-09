class Anvil < Formula
  desc "AI coding assistant with typed credential vault, live remote control, 5 providers"
  homepage "https://culpur.net/anvil"
  version "2.2.11"
  license "Proprietary"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.11/anvil-aarch64-apple-darwin"
      sha256 "f23cd6188e376f4998c33121848535157c86fedce295cfe3db613ed2ba6c5221"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.11/anvil-x86_64-apple-darwin"
      sha256 "4b98cc8fb3cdf7eca11c3159af61b55f1113957bd81ccceeec587b7cff78cdb6"
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
