class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.48.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "b23330953b8365c154c02f5ec76aed5198010d566b3c6116360cd7643515b2f7"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "f190605c1fb01de49520d46923fa0c11654589ab2a1ba22ec74597a6d7529e6e"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "fd216aecd092f5f07bd293b74e788a5534d6767cc1b366cd2de9d1d3bbf71e05"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "3f233d23f1bcfba839f5125599fe9c24c1b8fae1d687009cdfed9ff20b212403"
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
