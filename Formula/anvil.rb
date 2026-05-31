class Anvil < Formula
  desc "AI coding assistant with typed credential vault, live remote control, 5 providers"
  homepage "https://culpur.net/anvil"
  version "2.2.20"
  license "Proprietary"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.20/anvil-aarch64-apple-darwin"
      sha256 "1bd66d202f3605aa88d469f0e05b9ef4229727e40639991689a4b55bf8a81675"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.20/anvil-x86_64-apple-darwin"
      sha256 "9273fbd693b67d40c001207fef7512d9c6885784cf1b244c267e6b7104bb6b58"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.20/anvil-aarch64-unknown-linux-gnu"
      sha256 "88fcec2b68118d7ddcf66017bff3d5918ac339404725b3d7f069876a6d6ff225"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.20/anvil-x86_64-unknown-linux-gnu"
      sha256 "debc7b593108aeb6ab8ec78920d364fcaa3931d2500d85566c3818a8babbfed4"
    end
  end
  resource "manpage" do
    url "https://github.com/culpur/anvil/releases/download/v2.2.20/anvil.1"
    sha256 "e0ec68e28749a095bbe37da2fe83dc97ab26dc049625b97bfa73766decfedfbd"
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
