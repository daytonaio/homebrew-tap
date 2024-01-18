class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.77.1"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "d750f6c34cdd2d56a9df52ef4589021cedeafcfdbaebbd83362c70d40bcc2f13"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "cf965cfa31560df4eab42ebd2c5ae8edf3c95cca09969ee63dc5b00a55a89092"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "09e25047b83ab8f4b746fb8da827f534f103c61b40fd0f54d53b2a4e8bb06421"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "864e7cc86610248b047fdbf96dd6df999afe150203b7625d590d2cae3d8cd7e1"
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
