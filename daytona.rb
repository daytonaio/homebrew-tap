class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.27.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "32c05891621fc1fce528b02e9bad91a3cee4ac39475899d94fa8b4de429f8741"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "55a775f3289ad17530b32a1dabe47242bd684f8286960a546d9d61187066280d"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "3dfce540231a77a01c0009532b252351f17eaf0f61b937d72c34bd3bfc278817"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "eb9f2c69b03fa9adf980cfad77d9918331f765b7f479dd770d318e04d26b27ac"
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
