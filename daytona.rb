class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.72.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "55fa063b95d7af915ebb507b1ebef3cd2710eaabda822097b9a48ad95bf4a400"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "95bc566c30452f59c69d42d6d9a8e625f3be5f30ed95881eeee45db18d3b477a"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "beeece7f74d5bba65b32cef44c7fb3e3ee4857ea634184c38b4459d4807c76ef"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "61f86e8a7e10ebec377d20e92adaf34bd463bad92226d90fecbdfad90f909542"
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
