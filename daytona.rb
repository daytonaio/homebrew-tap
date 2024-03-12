class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.84.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "aa6405895598c1de981ef8b5aee4c0b5bb10ae660bce9c28b72828e41f79245d"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "984a7be40f0384dca83f8bb74e534300f3401ad28817d4f92468fc7745897c4d"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "1445c872e3a5f5c359fc9608e1f22dce1f3ff27effff34a363397e9d102a0c25"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "eec9bca003b58fb23fbe8b36d6f324ee44eec99059de289c405f7dbc89e4cefe"
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
