class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.47.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "1a78b90784418e4cbae2e97055d5296ff68e48e6d03faec97521f63c3eb3f80b"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "c4ebe2f76d29cab60553e69787841237d0f4605dd472e338bd7164414d0635b2"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "b255a6ab68b8c147d9a244b8d7f8c252476730a180d3909b536bf5d988872be2"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "8daa29d1f502ea57c3db82e22c33a5bfd80446eb86637289e8e7fd43df483b3c"
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
