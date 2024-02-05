class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.81.3"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "3e08db44a829ff0bbd336dc0196ae6448c3b66fe65cfd49ebf7e38795c7507ed"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "71ce778384ae7b2a74d62efeecd1f2cca56ef8bcd6c6d0bab83d973ae46136ae"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "b274bb228c0de5427521c43aba963210fb51cfc39c902c9204d3e757fe77a940"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "556616875194563bc992db496ca7cc3ee3f2866e849a529f45e0c20d0530e21e"
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
