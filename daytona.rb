class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.23.1"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "7bc685c63b79ca31835f9788274cd0b047ff73fa36e9452cda701ce535024be5"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "afe7d7b43dbcc4ec7777c8dcb224b6aedbbcdcc889a05f2e3c5b1480e82b145e"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "8bc02fd79c810da60d42c6da3c1fece3ccab4c33762910d1e8d3c98a834e00d1"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "a1f9877d35c4a11a8125115377d05bd77257bf5ee85e14ea3bce44d262dd7f09"
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
