class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.83.3"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "27360f6a16424c2a31174082c384765a579aa6b020ab5c722f52da97a102721b"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "31f0a8f2eabc0b277922878aa427876e0ae77191f889679a325390a34beb6215"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "94030aca7a898fefb828fca55016d59e6d0647dec22b4306da6e139f66db6b6a"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "546affa4be9366f8e5bf6a92df4a75367fd44875253da38e82bbc758f9d4bbf6"
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
