class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.46.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "0b36501b1b61ec3d8c6149a78160b1255e5660ba793d4f154be2ef38384b0ec7"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "511e633dd981c756deb504223d91da65f2a48e1ae5632952e950210e8b6e6a90"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "9136e4851cb74083df8234f49905c456ca907f294628bb99c9dde5d95fe19f1d"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "931a0041b35b0615340e3d7d15abad52666cd5b1d1b6d00f60f7c089558cc145"
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
