class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.18.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "13403e9820c2994a7785874f8dc9e2670089154b834f79b1a32dfc14997b3fee"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "6d83c0821e21bda09bd8f1ae34ba305e9840c3d32e2235037ec2a6965aaa910f"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "6512b204d1cd427bdd8526f8b42b843f75ed9543d9d5574eda7731df54eeea8c"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "aa224423c4f4fb33fdfe3c5b9ce4a380f0366c777c6d859f90eca4f7239d067f"
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
