class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.19.1"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "1871001752f99d2e4b8264c6a44921caf5f3462eb2b873f3253f5da91a5ef9f6"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "ee42e74b26453e4119207775bb3e906553685888db97dae3b3dd35d951d82b94"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "dcc4d8636c912d013847ca61b996b712e6db4652a52fee31e72d0d03b04d1e9f"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "371229a1a3de4af2748d29f8c234d26358e8fcb900862335828c1c65511be984"
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
