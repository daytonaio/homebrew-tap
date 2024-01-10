class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.74.2"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "96f0d0cff8ac59309371db68d0f2f95c50fae1ac3e39279797f0554e94ce51b7"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "4c02935b2fa056a115f47dbd5d93c26b4f12f0b1a47f4700c3b589984627f8e5"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "31304e2e4f14bce188e366bb505034865ea2e1bff8ae6f6e23c2ba96ad56c1d0"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "a321176f794f8e8992f086079d76f6ec589c681ff86f84fb5b30518b2d1d81ea"
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
