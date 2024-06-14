class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.19.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "10535b07cd906b7b6c938d3a4269e2918fe71a7a739095c368de86d1386b07ec"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "cb2832bb37f8dd35329edd07082e5c2069110a468e28e49d4f31e0dcccc786b6"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "ff5882b7f9bfa1e8951952e28781dcd817a3418e108d884d0838bb85e59a82cd"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "b1cab13ed0ae565586890a6348317f98691d030c6806918f21778b8839419540"
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
