class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.50.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "90bfcae48ec3db09913d56a3209715f42b96dacee6cf173070516eb16a953606"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "66915b0e72c10fba95aed569600b1d8749b26406517d23f900620f4145030eac"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "6578cd0936b5702fb9ef172b2a6c9e5d9d0181b62757db4cf3b4dd33f9149fa9"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "2b4daf0dc44820e45a586f945867dd5d5e386714d0ba943bda2cc37622899aa2"
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
