class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.30.1"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "284e6c830a54fdd1c166ac4e246f46ea5e93f7ece7298e26abdf58d1e39e79e4"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "e6422a1f398f251f6b3b9e9eb914a878e5d33fbd3865fa93bf194760d3af81b3"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "a4772d6578bc5f3e3f3a8594ce6fc7d083235d1e71779f24505477d7dc5d8e36"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "380f1e57986248d42033c95eb82188f2eb8df426866d33971a61c1d2a1b6eac4"
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
