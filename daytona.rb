class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.71.1"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "ad633527215299f2e0f5c96606b89f39982513c5d3bf79f44830e5d4b417949d"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "f5cd1097c6b7b2e640adc5906dcfb6a6bef81fd1408f2e499b52c8a750535e8c"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "4db24e9060e82a511c1014913a52532bebe36b3ef402a1c112b6357f460b0c35"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "f4c892d951c238ddd5046ee0ff3dbe6147844f5ad00d8a1cb771e7ca8fd5f83e"
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
