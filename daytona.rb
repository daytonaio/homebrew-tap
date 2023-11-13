class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.53.6"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.daytona.io/v#{version}/daytona-darwin-arm64"
    sha256 "6c16e366e4f2de5d7315d936833d4ff609308985764407d9fd1002b5b782ab70"
  elsif OS.mac? && Hardware::CPU.intel?    
    url "https://download.daytona.io/v#{version}/daytona-darwin-amd64"    
    sha256 "17aea9a45d94e4f5cd8b9722824f3d3c52f2096ed2bf2fd077dff88ba59b1a21"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.daytona.io/v#{version}/daytona-linux-amd64"
    sha256 "dccdd06919c0db60b01f7a911e91fe2bd96c8ec6561cd326b2eb87ca553095f3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.daytona.io/v#{version}/daytona-linux-arm64"
    sha256 "c997e08c0e4edc0fce85a1ccaaea2e2e0196a91293cbf1b04abdd39cc9035e89"
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
