class Anvil < Formula
  desc "AI coding assistant with typed credential vault, live remote control, 5 providers"
  homepage "https://culpur.net/anvil"
  version "2.2.13"
  license "Proprietary"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.13/anvil-aarch64-apple-darwin"
      sha256 "dcc3857b2de5869393bd1916f3f75f9c967b67ca321b6f6aa13e93de5573db3f"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.13/anvil-x86_64-apple-darwin"
      sha256 "5b5a0f22dce175e2c2b88fbd87c1412e9739cd11a3470cd951f21964cd6512bf"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.13/anvil-aarch64-unknown-linux-gnu"
      sha256 "106f5b1ad60e77917cb0de22f81802bf0b5e8b0260492d46e224d4bc866600f3"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.13/anvil-x86_64-unknown-linux-gnu"
      sha256 "91d5a35fa93896b9af758c625af487f4aee375d8cf8f211583362571c1df3f77"
    end
  end
  resource "manpage" do
    url "https://github.com/culpur/anvil/releases/download/v2.2.13/anvil.1"
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
