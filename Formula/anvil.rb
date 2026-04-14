class Anvil < Formula
  desc "AI coding assistant with typed credential vault, live remote control, 5 providers"
  homepage "https://culpur.net/anvil"
  version "2.2.0"
  license "Proprietary"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.0/anvil-aarch64-apple-darwin"
      sha256 "4d0fd9cf2364e3f03695c2bcf86c238049137f078dbdc0bd52a99838832f9c6e"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.0/anvil-x86_64-apple-darwin"
      sha256 "ac2761dbceba809009a34856b06d0383ca963e8c52cd0c5050921fbe9e565a04"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.0/anvil-aarch64-unknown-linux-gnu"
      sha256 "9317441e1b34aeb3f1014372f8b29b9b46955fc3b238dcf7a15b9a2425ac8e5c"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.0/anvil-x86_64-unknown-linux-gnu"
      sha256 "64470a74ada43cbd5c6a5495b5ce4c17e4895dec177dd3a78a838dac5f8b809f"
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
