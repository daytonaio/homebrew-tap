class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.74.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "7483fb2a1ac97906a9966caefefcbb0485d25d6791f9d2959ba632a8cb9b5878"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "e93fcb9fd9491c029555b1ff1430a44e3e8d98e47ca39a0aaa636f9b2757e866"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "6ffcf3a7d57b7a2bbab9e00359360ad00137f0c86606773a9067618290e185b5"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "8d8f11f207a524f1d64d1a94b5f98671ce0c22c22e71a9211f43f9cd964feda5"
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
