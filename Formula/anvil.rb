class Anvil < Formula
  desc "AI-powered coding assistant by Culpur Defense"
  homepage "https://culpur.net/anvil"
  version "1.0.2"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v1.0.2/anvil-aarch64-apple-darwin"
      sha256 "a1e28645578c7570b752a60c12702f1cb29674cfe6bfd4fb770eb96abce6a6c4"
    else
      url "https://github.com/culpur/anvil/releases/download/v1.0.2/anvil-x86_64-apple-darwin"
      sha256 "e2fe1269166e94ccf4709d901ef7d0afa1a4d889885cdb327792f0322a7b38e7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v1.0.2/anvil-aarch64-unknown-linux-gnu"
      sha256 "6b1aa7a69a854d8a128db3386cadd85f7d017bee7cd945469406c20085e4a903"
    else
      url "https://github.com/culpur/anvil/releases/download/v1.0.2/anvil-x86_64-unknown-linux-gnu"
      sha256 "a9a2cdaaaf3ab6981bcbadd313f270526959b6c2dd9987e5c498af2a094edb21"
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
