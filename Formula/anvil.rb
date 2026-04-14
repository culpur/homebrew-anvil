class Anvil < Formula
  desc "AI coding assistant with typed credential vault, live remote control, 5 providers"
  homepage "https://culpur.net/anvil"
  version "2.2.2"
  license "Proprietary"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.2/anvil-aarch64-apple-darwin"
      sha256 "ff5bf8ef26577aa05a2d3aee7d34bd6c7482c6e29489cdcedd55e1cf53b090e4"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.2/anvil-x86_64-apple-darwin"
      sha256 "f619289a3c7b9a7b092888bcff494fcc02434f681ad56db85108eba230703471"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.2/anvil-aarch64-unknown-linux-gnu"
      sha256 "285d578314ad467f4da335e45eea5cc1fd4123281ae88af2fbef7eb999074a8e"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.2/anvil-x86_64-unknown-linux-gnu"
      sha256 "28c961e1106047b63e09af95b98bff13a09d7e93da2850308aa2182a4bac62e1"
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
