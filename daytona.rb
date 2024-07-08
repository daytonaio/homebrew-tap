class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.21.2"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "9a469d00d3bf9c686fd0f1bbefca0318ebf7f5593a86f6f80277f7929482223b"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "71136e1fe66a775d6a4f21b43560d0a62e2007f8d753ca30a256f3c9f6c1b596"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "fef6a6c8e745d9fff72464366aca6324793df7aae4d300beb132c67bd943f613"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "369e87072ee9b2ce01dc36c43890d0eca34d62de9a8c12472a462a67a38c6132"
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
