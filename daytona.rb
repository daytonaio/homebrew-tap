class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.77.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "400ad45198df71a3d4b1ecec052ba47ebe31f25d709cc31ab0fd3e56c8805cac"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "eb29e87ef8e97f0bfc902004a0ede039820d46238e6dc7eb5c2874fd795218c0"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "152bafaed56520f7f0b8a91d26525911d7942ca502eb20cfecb1d30c84b24b50"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "d726a9bfef5bd4cc9e9055d842796d391b2cba4c3ecd70589d352f7bf1091312"
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
