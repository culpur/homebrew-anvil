class Anvil < Formula
  desc "AI coding assistant with typed credential vault, live remote control, 5 providers"
  homepage "https://culpur.net/anvil"
  version "2.2.27"
  license "Proprietary"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.27/anvil-aarch64-apple-darwin"
      sha256 "6a062f3895a9c19571070c3a2ce7b8765ec0794a4df12a3ce9c9648fffa4af79"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.27/anvil-x86_64-apple-darwin"
      sha256 "2ede1cf5cd701670465278df504b9a53e78ea5fc1995e31aa17a670cd3622761"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.27/anvil-aarch64-unknown-linux-gnu"
      sha256 "b30b8e4476d21ea15f9b6c0f8429d0cce45994c59a252732b3854e2493f7afb7"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.27/anvil-x86_64-unknown-linux-gnu"
      sha256 "e5887f5b699a0f7475025c54a78e3a8fa4d22b2ad1ead8feff2c63e94fc847b7"
    end
  end
  resource "manpage" do
    url "https://github.com/culpur/anvil/releases/download/v2.2.27/anvil.1"
    sha256 "cd2e2f1cb5bdd14e2a6cdba70cb7e0bdd5bea64b6824d7da8ec6a74828f1b33b"
  end
  def install
    downloaded = Dir["anvil-*"].first || "anvil"
    bin.install downloaded => "anvil"
    resource("manpage").stage { man1.install "anvil.1" }
  end
  test do
    assert_match "Anvil CLI", shell_output("#{bin}/anvil --version")
  end
end
