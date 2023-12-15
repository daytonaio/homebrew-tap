class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.69.1"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "17b0d46cf107ce4aa0b610c2936959ee42733a7cca30ff77f86748754495f5ee"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "bc25461b0846f8eb1fb129087e8b5be36dbe225e49d367e3c4232da0f0ec4470"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "58fc0497a2aff6157bddda1aa70b6d34264f3a7c0a5d956a861fd2e55205b323"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "117259c4c084e26e4984bf36779a68524c87feb9527392a02c1a5634a221eadf"
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
