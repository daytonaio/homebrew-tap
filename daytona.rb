class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.25.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "141c0f4fc11a4739398b639a54b7584b280fecbce3dc6e25dc743f61b8c28cb5"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "7d35b8e359bbfd4580da492fccbe6d828969573d304868b1ee855addf38b2751"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "958cf5100b07b454b39d3ff72a624a9750e2c3dfdf8d676b601ad09b6e1b528c"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "659518d8661cbdc1a9f2db8f515ce2a1b1ba40218205681b79d32ff8f0d9d421"
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
