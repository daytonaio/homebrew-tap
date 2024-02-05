class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.80.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "db6d88d82f6986e3d22771dfe18417d9dd058ccc5a46b0d9c09508ac62c60d7a"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "8575b99316b32a9dd3bf39b028fde0d6931617d7f4869d2a1ada0b3a964fac43"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "bfa6c77cba932469db46870fbab2ad550bb38c36e962de58d8d0b244065b2a3a"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "e3dd401e3272d80da4d80e3202a34dcaf1bdd25f053afe2b2fa1367059807c33"
  else
    odie "Unsupported OS/ARCH combination"
  end

  def install
    bin.install "daytona-#{OS.mac? ? 'darwin' : 'linux'}-#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}" => "daytona"
  end

  test do
    system "#{bin}/daytona", "version"
  end
end
