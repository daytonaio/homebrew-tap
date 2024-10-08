class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.37.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "caa05c6827794bbed1ef4fae26b7c316902c5329b5ae5990e7f0a53bba3b2cbe"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "23b5148e6332099a4517c86d8dc3187716f965aadc3124f7d94bc15f5c107071"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "ae4eafa895a62e660214fbc5d1afbcb22063b8a3cdfa64f6b3246b075f64b753"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "3fb973735aa8c304f2ee75c0495b0629d63c25a21c53b768fb0eeecb3c697498"
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
