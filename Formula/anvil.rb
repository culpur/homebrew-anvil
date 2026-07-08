class Anvil < Formula
  desc "AI coding assistant with typed credential vault, live remote control, 5 providers"
  homepage "https://culpur.net/anvil"
  version "2.2.25"
  license "Proprietary"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.25/anvil-aarch64-apple-darwin"
      sha256 "7ba82635d34a1ca6aee0f8765891fa6e0d082a5d5ba0a4222b6426a0105f317a"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.25/anvil-x86_64-apple-darwin"
      sha256 "b59fbd70a282f06294e71cd8db195ed4679a8211e469de71302e79c62f2eadd9"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.25/anvil-aarch64-unknown-linux-gnu"
      sha256 "94d8679ca1401bc8730ba0031c714f6b74876ca4cbe9efeb4160a393ca71de62"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.25/anvil-x86_64-unknown-linux-gnu"
      sha256 "cadb9f8fa67cb08e8d5f751016fa936285b38c0c240afcef9be6610a1257ca61"
    end
  end
  resource "manpage" do
    url "https://github.com/culpur/anvil/releases/download/v2.2.25/anvil.1"
    sha256 "bfd68dffeb1e021f52ae6ee47f215476bb7cb07a7733e87f4129aa9a37cacc92"
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
