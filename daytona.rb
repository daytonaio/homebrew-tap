class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.21.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "4333602b602f200ee421f858474c5910962236b71963542f5e25a0be3c54c539"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "e35319c01614b7985cda2937c62593ebe433f9175302b474ec6556d9cfd2b4cf"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "840d727e2e1fa509e217df45e91fb34e956068a55c2e215a9f7cc574e05364dc"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "45e0e1d250a8bc22820b14bbe0e8903abf521f3b7bc54566433847ee839f1a8b"
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
