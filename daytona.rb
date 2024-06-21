class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.20.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "2e7226248c3e89f421a70399c9e03f763e7d1710f0a1696c6d5fabd4b692c9f1"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "c361b7eb573068382801f99ddc8f027e283b6fb8414cf24e409086bde828332a"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "7c971be5dee7c34f1452e615fc6af1ea709e0e34e4358446b7892d2e4c7492b1"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "1012ecab42c4f182d57b2e5b21fb14b31a33d3042c4481758d45013a732bbf6a"
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
