class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.52.1"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "34bcafcd6f5887bfa211f4387c72bfb67bbce005025c3c3ac185e82d6db22174"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "1529aaa846a11838626af7292a03effe52660b0d94299194b072f546da036a4c"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "7fda31e5e250ce2aa3a1c6ee375e809f28722247b42c256e306dec9ff3bf9472"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "8fe460dc8b74f92013d6973123db23140d5c0ab5451c5d3689b0fa91e1dbbd27"
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
