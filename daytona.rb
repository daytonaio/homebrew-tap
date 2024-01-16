class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.75.2"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "e07320bd79ebc0b773f988b5e1f143084140e49c48255e9e95a9e6d7d508b5ac"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "4918654482c3696737b0fb3903c5d95bba14f264a0cbc70fa6238fb15861eb8c"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "adaa03ecd6a1baaeeb9dbf8174f585c345f80146da7690fa45dc12816ecc705a"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "74bc366243737793d827ffe293970dad90a310db1227b8443263aff30cb8c2dc"
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
