class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.40.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "5b6a0453bc1b8de59e66e50a7006fa09e20317619905c1a406d3194198a61231"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "dc422f3350b8364a8c246e8fffb2274f09310bc3fc58f13c09b7b4fac3bbc3cf"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "8e4a89b225211b93188a987392d90b438c2a14d3fc045e02b276bf1a52735b90"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "90d1f42f5d2054cad2d874e465299aba765545c05c37c4a98dca37b9c9c615b7"
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
