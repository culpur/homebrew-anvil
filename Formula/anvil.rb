class Anvil < Formula
  desc "AI coding assistant with typed credential vault, live remote control, 5 providers"
  homepage "https://culpur.net/anvil"
  version "2.2.9"
  license "Proprietary"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.9/anvil-aarch64-apple-darwin"
      sha256 "8cace5a659c78055d2cae51df6787629d9bd9e777475bac7bf3b38371cee525d"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.9/anvil-x86_64-apple-darwin"
      sha256 "f00eec5b6dfc557d8a2018f49f61090d70e80762bf69f89273cb250593ab5d24"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.9/anvil-aarch64-unknown-linux-gnu"
      sha256 "25c9d5cbd66325a87e16b170f2a86626ae99f852317d6b5d80989404a4bd3c99"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.9/anvil-x86_64-unknown-linux-gnu"
      sha256 "3861f8bd75d5a4ae3edd743649caca77eceef0e07455623a258db974c84bd77e"
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
