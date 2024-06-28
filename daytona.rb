class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.21.1"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "7e1888a314336ac250161d39045b5f1bbd68db19fd96b2af18bc627cd2a2420e"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "3fd6aeff4005bbc57a7f6ebf50df02231c86bae946bd46d78855baf12c31da18"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "786194f2ca69ae23bdff113ba4f17970a8f24ed6029777e1fbc3baf95085b8df"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "74cd56a854e6ae44fa6810ddd46766a2761bf0ddc070e5ea4fa1d8c5a8cc8e35"
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
