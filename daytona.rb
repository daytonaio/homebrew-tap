class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.44.1"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "e7cfa262100cd7a130fb11ce8c7f60b1b8e211c440cabedf2636e78792af842d"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "239dcad2460ae0637f342109016a7dd14b94df920bad621ed53c87664dc33e94"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "fb7ea8b80211ca53f83b2bca9de10e446c6fff4840f82d4f639eb23aa9203dfd"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "1c0d1fefd20a1d5f35e80a3aebefdddc269e487b12f95c93a06c693475ea4db1"
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
