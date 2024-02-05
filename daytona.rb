class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.81.2"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "8e059ef4c1c68fa0a13c0ae706dc5a9042a11a014507c15ed7871e6cd0cff18a"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "48885685001c30e210e68bebe156a36d3dba35cc6e4d777a386779eab36ce550"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "ba3659e288d92ac40b92c501c4ab3eb7edae401b4cf23cac4131b3cecd1d337a"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "832a7d3aac578d364711f6918715b1d3cc59f9a219adc38b958e517ac78ba2d0"
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
