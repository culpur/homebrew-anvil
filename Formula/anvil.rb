class Anvil < Formula
  desc "AI-powered coding assistant by Culpur Defense"
  homepage "https://culpur.net/anvil"
  version "1.0.3"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v1.0.3/anvil-aarch64-apple-darwin"
      sha256 "34a07d7439e183467d1f6ac17c575332b87552875e623ec843ad0dafd55d3f7f"
    else
      url "https://github.com/culpur/anvil/releases/download/v1.0.3/anvil-x86_64-apple-darwin"
      sha256 "c73ec81d9c86a7c8a09627ee25b192228eaf3ed5c91a591182ce790d33613fea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v1.0.3/anvil-aarch64-unknown-linux-gnu"
      sha256 "4272982bf00a7d2ebf71080d3e25c68d77f64398d3a5037fd37dcd911b2d9cb2"
    else
      url "https://github.com/culpur/anvil/releases/download/v1.0.3/anvil-x86_64-unknown-linux-gnu"
      sha256 "a4c971d77a732760451074660e78690bffe359c2ad231b16375907645799476a"
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
