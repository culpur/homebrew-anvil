class Anvil < Formula
  desc "AI coding assistant with typed credential vault, live remote control, 5 providers"
  homepage "https://culpur.net/anvil"
  version "2.2.22"
  license "Proprietary"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.22/anvil-aarch64-apple-darwin"
      sha256 "d096c08cbb00bfb0676e002fec3e041b0b42785a52fe2afaee233c4a6a6bb21c"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.22/anvil-x86_64-apple-darwin"
      sha256 "3e8a920d4067c76545fcee15958200b8639373782218e845b6e9a72f652b35c0"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.22/anvil-aarch64-unknown-linux-gnu"
      sha256 "c1d786cb730185b0385068dc827dfe3ba2dca561d06f4cd65f5fc024d713c01b"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.22/anvil-x86_64-unknown-linux-gnu"
      sha256 "57d11e4862bdc12240f9c4e815e2e1a02b8612b49b3dfbe97fb9411c7f0f8523"
    end
  end
  resource "manpage" do
    url "https://github.com/culpur/anvil/releases/download/v2.2.22/anvil.1"
    sha256 "358fea1175cd158aa7af7ecce2354735adcad5cd2433da837909c6f4252ac50c"
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
