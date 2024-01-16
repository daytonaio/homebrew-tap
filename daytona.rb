class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.76.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "7be546cb6703e54b42ae838e494ac461256c02889cad3ee18097f8a1cf3508ca"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "1e68538e458e98d0e48268deaeed405e7a08af8fada2559ab8dd7b45cd612b52"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "7e417456a431d3d51e10eb9d6f1f8a61bb8cfa08f59cdbb08a8c09f3c8aafa87"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "6700550e7e62dbfed50d601ba9f9d7c59a2d0095323212357d960450ba16aea9"
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
