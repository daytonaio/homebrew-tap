class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.52.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "5815043f94a62c059658b0a90c244db9b5769054983c2dba4f8d64682d4ca5be"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "927dbc8fe0006117bc67757929e1dd3afa0c23867a182f20a1f850ba65e15e1e"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "8153bc78d118dbb711466ae825bd73732b14b98d2c0df80f3fa2702feb148619"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "1bcb768bf0747b00d042667d792bf344e081bc4593de606d339165b03ea7119f"
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
