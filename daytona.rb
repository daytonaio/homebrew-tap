class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.46.1"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "097773c8868f62a79e87df2651842d7eaaade8f04aac08dbab8548bbd660f3d6"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "cb7a74765011135570b512d14d8d03b683d1a6c7bee212a3ca5ed051d22c3a43"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "e39321d5be18c771191218c438721619d6a657b55b22c6b3483b6989d91698cd"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "e28108eb4b334ca3688abd3b24a961a17fa9d0379881e563d492d883593afcdc"
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
