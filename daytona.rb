class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.25.2"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "6c6f8e7f1350ca2e00b6440ad6546a7657103b3e73c8723a97b730aa218b630c"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "980b973ee1333ed0175068909d31740d021772b4f212242c338dc260cb232c79"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "d70dffa75d129300df72610ab9a8739fbcd4400ef7dcf78712cd17e7c7312068"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "094683e37766b071dc7b44640521afe128888bfe78f85214f620d97137d95d47"
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
