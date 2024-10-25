class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.42.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "b23b4954bf3f3d1925d19f4faa281cb274418ab64d9f3124983143d4b2fa1b6c"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "76dcefd4785797decb87c621d490cf56c4143ecf2fa2ab62d933271b3af35956"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "4caf7f31786606ab11730dd49cfe08c2a2d3ce1fe526986b18f4d88b421f2016"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "7789db04d65560674e2a35ed803902eb4b65d2617b3c25481522876ebd638e9b"
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
