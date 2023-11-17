class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.56.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.daytona.io/v#{version}/daytona-darwin-arm64"
    sha256 "04dcbdb3965867aa39596edd694002e7022c9c0ee9fd38da1f41c94b283c4a83"
  elsif OS.mac? && Hardware::CPU.intel?    
    url "https://download.daytona.io/v#{version}/daytona-darwin-amd64"    
    sha256 "5415f5cfe9cab996ec476ffaf220ef713e6e008e6be9cc95b09c7a8e767dde88"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.daytona.io/v#{version}/daytona-linux-amd64"
    sha256 "7196db468f75d7aa9df89f316cf32ce341aa7f68d9f5c5b83d701139f3fc5bae"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.daytona.io/v#{version}/daytona-linux-arm64"
    sha256 "92262e0bf4f91affc8e0b544930379af06bb61e51dbf919e70c55c6acc39361a"
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
