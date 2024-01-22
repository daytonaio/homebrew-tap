class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.79.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "488f3d878e12879e1f6fb845ca2f3999ed3b2be93506b1593b7a1ebd6df4ee18"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "544f88b17ddb11fe26e03bf8aec6d3973bc1ce5628ac83a31946f4c223d51cc2"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "49d743fb4a6eb2432e042049911ad007742f53db6fdbb71b5995c9d53c3bb631"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "d43ac3233b8200419544559fc15f05b7b9430e6a00b1c540c44bd5066e413905"
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
