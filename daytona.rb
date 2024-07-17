class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.22.1"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "e0a6481beed6cd8a3958ae1f2d58ebfafb533abf533bbfab562c545e76d9204b"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "b47b44ab57448ded798b4bfc9d2490a5fe9e2a8bfe3a429879d4930930dd6c38"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "d558de87f5892efc3b7bf72759b8c3622205a80c235e28f1e8bb80a02827ea6e"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "6d426a0cb6c8eaf7caabfe167b3fe59e35e18725f6a747566848b3916894ecc6"
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
