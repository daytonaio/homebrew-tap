class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.73.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "96262b16e8493d944c96935b53dae605dd9301a869cfa7d4cd99a17425800435"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "649b629c2c169b13b7e61e875fe5da65c29f671d060ec2f0e82edcc08e7ef244"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "956802c1ccb115fe4809eb4cc25cbf9d3e82ddeae97d7ae181f23d9b5a687f1f"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "d3948fdd59a768f3ebc117794a83d8617af094ca767bbd3b57d081b046f837c4"
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
