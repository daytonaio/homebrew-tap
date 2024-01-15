class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.75.1"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "f05966b6ddd029b054adf61aaa5d924d22ac58858e509a3a7661b7d65441a213"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "05942cda4828e38d230a05fe7d335dc0209a7ae14b1ad8253d5c7a2a49a99b45"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "e736f6d33878a9f0c8b8a71aad58b2392b4d8f3f7ac32599a50db13a10fc881a"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "1a00de212fc69b2d23866e0d234e3cd299f74200519b6ba2381a09f9d38278b7"
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
