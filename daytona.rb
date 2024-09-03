class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.28.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "5189b2e04c368ee6de560e4b60c690f597d92ae9de2d278909b8d18e6945be84"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "347cdeec0e2430de6689f13ca8005de34fff7cb95adef6595a9e3a9722df1879"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "83e55af717256bfe81435171eae9c56f3a17b6f6ac49a56778ef2074744431eb"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "89e398f35283b95b98202e82663b6c132b90171d3177a3a2c0d2ae1c56d0c6cd"
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
