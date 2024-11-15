class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.45.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "5c3f38a2f52a431a74a8b00e165b3732a44c5241582f3f6c552c215091cf9eae"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "c597f479eadfb2189bb253fa991fc57034a636db82de78739c355895c7ec92bc"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "be26130035abf5c96254365c7c8def29e4fabc0013c31dc2f43a27f4649fbefc"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "1da2a1d2c2b1122b93c40f6bc0e8bc33ca70f8c447544954702c9b9385254f3b"
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
