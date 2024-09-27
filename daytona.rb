class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.35.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "7b241eac8f93ea01af3b1b781c13fb78d208ade864de3b811655f34890821619"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "3ea585929438465f96d3f8209bf592bacec759a5a8d53b55fbcdcdaf047a5eac"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "b206a85b7c1ba963925a48b65d3825ac55ffcc24fc00041b200dd85bb7c078f7"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "ad0333edbdaf876b11f007ce69fa78cd9cc2083939e1f50d96b1a2c44de5974f"
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
