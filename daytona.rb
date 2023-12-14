class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.68.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "e03792869f75831b372024880938a65ff188b3053f0ca68831d25e90eb2474ba"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "2c331209fcee2c2d1ab9b807ea92f7f289a8de6b971e49d724fbf9729505212d"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "71271aa0e04accf877fbdae1784337c948aa378dfb963ac297394565c89f81a1"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "6d53257b5515687d4f1ace67165b5716319ee304f1f4c37540e8f3d521059081"
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
