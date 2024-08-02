class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.24.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "56eff3ff910ff08d57ef7ed37f0d80a7f6c5d95d4efd0b6b326c0ad7fac83424"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "402b78a6c5d8247d82b3541d092561461f74a45de0663ea238961e7c21f7c2f4"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "8fcdf11286ac3d8cfc520f78495ab1bfc2b1c43775eb3c298c2ae5e90c05c1e5"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "0920c97220cb1a2e2400e0c6cfdb9c3569ffabf86622a0c2c04905ee06cf9c57"
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
