class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.69.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "70a9c23b9a5b167e3cde25dc0aab55854c7a220649855faa926041f11ff4e777"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "b4e0f21462e295def40bb14cd73883122c1a78d4bd1920a6f5773e92e5783b39"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "0e1566703c2603e07147e136a55aa27e991c13b2581cbfa38d0bedbae6adf4e4"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "d249d4e3042618b389fb74599574cf0e392703e106a53b90cf5f3bb0d27e81e2"
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
