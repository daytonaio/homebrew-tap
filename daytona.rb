class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.72.1"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "1a65cb65d18182ebbffda823053c87701a3db7d4a2f887494362128f603dc56a"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "cd476ed3b94a785de482bf24b2b8ca0f8d7a82eb30bbcf039a4e7622822ded44"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "5e67915d6737d508e0c37c0d4152566553d2b330a168f4b88867c60e132de99c"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "e267eceaed474603b83bb3f5e3c5e4eb0278d780952d51a5cc781559d88da592"
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
