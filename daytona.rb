class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.33.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "26a3d8e00434430edbb16a94e3ce8a0ecb8c0830b02b07ca735d92d4fdf7b910"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "b048f8a31f94dd18f20fe74411e97ca508c031625d0470aed993738ab8132352"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "5837b751e6c0794f7f9074f9bbb3a412b9a25b71d74523e579dd70514e082436"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "af40f18093c89e170a23d27426f7356821c8f1ee611c75eefb865355b76dab3d"
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
