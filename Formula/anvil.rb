class Anvil < Formula
  desc "AI coding assistant — multi-provider, live remote control, encrypted vault"
  homepage "https://culpur.net/anvil"
  version "2.2.29"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.29/anvil-aarch64-apple-darwin"
      sha256 "4fa17f9708b337c86b53aa864831ba60d28d2726e1b5a73df6fe6dc1807d8fcf"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.29/anvil-x86_64-apple-darwin"
      sha256 "f0b0c807e0d8c5b405f86ab7276b08ad3290dca828244b73f41527124cabe00a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.29/anvil-aarch64-unknown-linux-gnu"
      sha256 "55faf1967ab43bb46f609209899c3de8a97aeb2f6024d99d1ab868085fb93f1f"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.29/anvil-x86_64-unknown-linux-gnu"
      sha256 "091aae3ed8c9b2f5062d3473409c4e6020d55510a3b117d412686d72feb8b273"
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
