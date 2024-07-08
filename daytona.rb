class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.21.3"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "d4e0361843462365c72f9e02ccf1d47b7f5f54d7de3a88b9949992610c3f0110"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "f5d55108a2a7603d79390d03566ede13d07129eea9e4ce5e29ae24e4eccec432"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "62b7b1952b3f505484215dba9052481ca4fee10576f5ba75291efd827e0a8cef"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "6967108bacfb97e66da6b49133a37b52711c7723f7ccf28e5ab2bd048c948210"
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
