class Anvil < Formula
  desc "AI coding assistant — multi-provider, live remote control, encrypted vault"
  homepage "https://culpur.net/anvil"
  version "2.2.23"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.23/anvil-aarch64-apple-darwin"
      sha256 "f0ec631479323603c7032c67650087359c018c93c0a2ef91ea9cb76c068cdf5b"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.23/anvil-x86_64-apple-darwin"
      sha256 "27dccb64a66c7e6395daa5d69856e5a53b66b62af6b4e68bac1b97b436a8a85e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.23/anvil-aarch64-unknown-linux-gnu"
      sha256 "8b0b4fe844e82c6d4d17f3eb70755e1ab290e810aeeda6a9c259db692c15d131"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.23/anvil-x86_64-unknown-linux-gnu"
      sha256 "c63bad637e429ceea143e8cf342e8c81e8fa1090880ab706defca81d644330c8"
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
