class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.64.1"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v8.64.1/daytona-darwin-arm64"
  sha256 "9825d3668c8dececf7050c527b3a7ab668c0675fb54bbf47c7137eeaaa9045f0"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v8.64.1/daytona-darwin-amd64"
  sha256 "a698e6d104a0c27b92402326805b8a0edfb841fecef5f13cc208eee3a0d5e167"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v8.64.1/daytona-linux-amd64"
  sha256 "dc6f77ca29c8863fcd64be3d5c6c9bd1f484e5ba21467738b346a8307ebfa789"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v8.64.1/daytona-linux-arm64"
  sha256 "750ddf3c882e482cd7084d10df8fe8ce4551594fc4c4abbe8d5a0bec8216f0e7"
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
