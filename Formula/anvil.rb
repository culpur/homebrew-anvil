class Anvil < Formula
  desc "AI coding assistant — 31 providers, Cursor cloud agents, vault, remote control"
  homepage "https://culpur.net/anvil"
  version "2.2.15"
  license "Proprietary"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.15/anvil-aarch64-apple-darwin"
      sha256 "252079ceb8ef9871680ee6c70ef9df213581e9429a22b6739214f8e296061cc6"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.15/anvil-x86_64-apple-darwin"
      sha256 "0346f9218143aa69a3a0c78de76c07313d0f4c10ec063441e4695dd52ffccf5e"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.15/anvil-aarch64-unknown-linux-gnu"
      sha256 "dec9f4be9b9a593ed48cfcf9c954e5ff71cbbebee041ceed305ee4fc6878c0c4"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.15/anvil-x86_64-unknown-linux-gnu"
      sha256 "06d52bf432eb4690067a40c66a145c6322976823c86da900d3491f1fa5a77606"
    end
  end
  resource "manpage" do
    url "https://github.com/culpur/anvil/releases/download/v2.2.15/anvil.1"
    sha256 "710ee6b1640cf31fb5900b6bd1e1d9bb051ec1d290e3f2a10d632b9ed8c91227"
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
