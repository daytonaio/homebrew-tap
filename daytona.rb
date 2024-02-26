class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.83.1"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "73763df41049203ce1954aae7b49ac2e4f5de4e6fcba8082b934141566e1743f"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "6aef5083301915cd8fffa6cae7005df161870212fe05a2e2ae3b33b6fb63cf49"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "9cf34137c6c2de2d214e28b6297d12a38b85a830b8f79b100edf509b8a22259f"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "eba3bf0c42e7ba8be008ec3132252ea5d8613e1bfb39e881ef12be930c09cacd"
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
