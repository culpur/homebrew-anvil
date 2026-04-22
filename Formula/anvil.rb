class Anvil < Formula
  desc "AI coding assistant — multi-provider, live remote control, encrypted vault"
  homepage "https://culpur.net/anvil"
  version "2.2.8"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.8/anvil-aarch64-apple-darwin"
      sha256 "3eefe3f37e25ee4544b23bb0c07d318339b10da306d4e78da21f28007aa73bd2"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.8/anvil-x86_64-apple-darwin"
      sha256 "6bf06d967ff8c9a20ae76c55963ec2d5afacd8a82c75b05ed6678bf1dda7c818"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/culpur/anvil/releases/download/v2.2.8/anvil-aarch64-unknown-linux-gnu"
      sha256 "644d4e581d33eb61a58f4c32324dbd61ff3861b9ab83b4bba4b3828488d6b351"
    else
      url "https://github.com/culpur/anvil/releases/download/v2.2.8/anvil-x86_64-unknown-linux-gnu"
      sha256 "a57618881cd080617e3faba25b490c5ceb3f11d6b2fef9c695e7f4908ce2dd97"
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
