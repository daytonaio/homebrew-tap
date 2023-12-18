class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.70.1"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "872ee269e601379a6be4bd005ba4e6d73d559d614d6a78a2f6ecb79800618f37"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "f23d59eef0dfb5b86d6ccb0251b5114029448120d90f7fa56985584e5f53a2b9"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "ff05a4f6c98ef7f7a5ac8f8e8392ede66ec09b6205ee2b8fd9b0febc0a8bd322"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "10c597de0ed923f11b6c1587158fdec09af29d181d020d45e89feba1c0a98f31"
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
