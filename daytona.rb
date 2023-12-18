class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.70.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "2541e02b782877666e25cf3e7df5b5dcb6458197a902441a6fdced4f7c859053"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "ff0f20c34a9dcc7c59169995c851ba8911328e286b7c2f3d4847c661c3b90e94"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "bfee2eb931a1b0879064e830c4431b39fa53497468d389487fa9ac763b295961"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "3df020226415ea337987631c564f62f7f43a14bcce574e621c1df86c039b61f6"
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
