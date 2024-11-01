class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.42.1"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "fbeb68d21e1b169451a1f80ab67fa8565fc90c7fde3ea9e3947e3e21d46761b2"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "20e67ae793e2788bbf32d3c85cb3aec700b6dd1c8b723bb5b20e185b20c6c029"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "ffd72c74a577d33ebeb399a0d678854ba4476df10709545eedf7d2ef1a3525c7"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "4c423d66fb14e2e296f620d9fdffad85c7e7cde1a7ec65411c50291a97116cbc"
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
