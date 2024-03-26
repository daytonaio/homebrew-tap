class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.86.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "9cbde94772a121d2a91a7995e07368283f2b262498f8a6c767f1874af085f712"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "61a73afe8b9c1264bea80a8c5a8a0532b3f06de221a3615753dbb4dd38be20d3"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "ba42c3517cadd875b1e718ac2e27a50b373fd3628c0c7c70a8550d8ebe8b5ac2"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "a4d0fb48b5a82f86c6173f1dac382c765db0428e3122a310edebfd334d7a81dd"
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
