class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.44.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "474c297278f49192e55675ce3f733a6144522b47a2248a80194b78fd23b6a4fd"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "b022e7832bab1a9e0cb686f312adef2c53d4bcd0478e55c28397cb9c6ab99e4a"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "4bf6ff4ecf6b9c0620c9b56eb4348b583cf7e272cb722aecc9a8053d4729d6c5"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "c111ea509280e457e7153c770968b2b18b8dfff0129fcbe78be5aab3dd127cda"
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
