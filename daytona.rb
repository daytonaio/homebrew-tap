class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.38.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "7e442349ebd62ad4d9fdcc178f0408dc0b331f213bcf22b3274685b8654a1759"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "cbb424d49b597ae83e8a37b569b65306ae249b505dba06348283c99d448e15f8"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "a5df15bf1cb9597911d67ada7c031bfa1dd434cf67152e90cad2790983bb227b"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "2acce990444d74f7f5a093ae9689ac351558c9656b7813629711863528d75b0e"
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
