class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.79.1"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "ce8e66b8c3dba5d1cd3470fba809e7241506970c6bfc4f978cb7cf30a01e83fc"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "f907ed674e5fa786982c0a6d32231b74a8fdae99fd7094e6970cd83281da976a"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "ea4af558211da996e8d5fe1a88171eb8153221a08d60544f23209d91ce206467"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "8a33b33abcb0390920a069a2dc86a1280a1f14a77fdd3c29b712f07ddfd98c9a"
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
