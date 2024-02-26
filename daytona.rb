class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.83.2"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "03a1be1784e2a8ce78d4b1f20e093a6b96d401bf0fd0e26f5316495d06359822"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "64ac0e3549f0a211bae03107fabc610345472de6bafd75de5022868de4be21ce"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "ce5294e9ee3f7e054b33fa25e0459f58e752bfd1f52cdda80b905193f7736855"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "a1b6115ed309400f606b5bddc064c09b27cbcea0cfc7f9c4d543c45aa58aa1f5"
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
