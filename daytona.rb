class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.36.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "080a2ac9e3039a05b4fa1241cc0d87920844dd28b5ddc0a3fc907dc840014ddb"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "308751661b758663ae92a52c83e7b5e925f5a848cefdc69f3a4a9e7f628dd9c1"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "54417edf9b92b05d96f6213485a05581283cd100215fb9ee4aeb20dd58f654ba"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "8fe0deea412620e7d5d1df3b577d374e4d46cd26f858154af2181b249913fb8e"
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
