class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.26.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "ab143e7ab4862b06e82e4c50e62871c1ba4d854e5186a61095b77088ea5af9ee"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "0e7408451e71807a3d9702101b9ff6c1d5258030b2962e6828a9580c536aaaaf"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "523ad6a1e32870069b2a1ac88140382dd50f5b112e9a82a33f652234bc13b8e5"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "46a38178fd6caeefb88ddf4c8294f679158da4f9550a0c59cb384d7833231f03"
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
