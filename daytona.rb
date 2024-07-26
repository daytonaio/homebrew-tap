class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.23.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "a9d7858b0a06ba89be9c3b0fac486af0da19c5e7ef7c87bd478868a8c6317dd3"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "33e98f078e46effce14bdad9951522a04b49e38e2283fce7ded3a1c786cb8b70"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "52315ec09068ee8e3beb2d26fbec50237c87e5fdbcdcd32aab825397eb0e0343"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "94f688d4a10b6c67efdcfef46047dda1d111f88e165c69e16210a5bb491297f3"
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
