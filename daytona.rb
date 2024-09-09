class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.29.1"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "cad491fffcb69d774b55e54bd68328a3b1bf67be25accc968a793ee735303847"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "4419d7d7139e3bf22b07f774c42337cdddfecc442f98c34c342c64ae87917cf1"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "ba53da732c11ac3f12a6a115e612bfa4068c461a160f7159d8fc3b37d9800f17"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "95e2ff6af4d09596342304dee10a3dd033e3b22d1495ce72f213c3572f954b21"
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
