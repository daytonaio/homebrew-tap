class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.34.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "020fa34278d8513461c72fba12564f9614b554925f403c0368d69704fb74be85"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "36ed8ea98f431dc9576ce5093de42a7b116ba9a00fda8ff1779401327c74bdb7"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "cec88d7a2f35851566616515808e9210cf74c37bbec837f9561cce31d7e5c126"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "1144af0c8d8f5b16330ebeb023957ec79d031fc2d3c8adcd144eb6116e9de29a"
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
