class Anvil < Formula
  desc "AI-powered coding assistant by Culpur Defense"
  homepage "https://culpur.net/anvil"
  version "1.0.2"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v1.0.2/anvil-aarch64-apple-darwin.tar.gz"
    else
      url "https://github.com/culpur/anvil/releases/download/v1.0.2/anvil-x86_64-apple-darwin.tar.gz"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v1.0.2/anvil-aarch64-unknown-linux-gnu.tar.gz"
    else
      url "https://github.com/culpur/anvil/releases/download/v1.0.2/anvil-x86_64-unknown-linux-gnu.tar.gz"
    end
  end

  def install
    bin.install "anvil"
  end

  test do
    assert_match "Anvil CLI", shell_output("#{bin}/anvil --version")
  end
end
