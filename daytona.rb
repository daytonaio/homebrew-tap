class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.78.1"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "ab0a21c480005f37d99354fd102237fa82b1e7ebd8074f0797034fad009e29f7"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "c25b83c3c3236a2d0f8b71a8d6554baab8e3231d2ea8b62068970ee65f12e299"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "a6f2cfa4c90c153dd44320ed93caee10ca5c514eea80de3833b5d780ddb83e66"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "70cacc3371ce54ddf041e5f5e0d48cbecabfef58f4660eb74263cd16cd6b4460"
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
