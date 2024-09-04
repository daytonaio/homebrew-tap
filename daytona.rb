class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.28.1"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "18f4564572a83b85b0b1a399e32b8a784950e54c42ac82da8d09c1ed3f0c9d49"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "a937bbe3fb789f13f67aa64344b653d6c986d44eb3219463f20b1ab75940f01c"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "f4a7bb94f37ac1e217f66d7dadddc97cf05dd9773a3c8d82cb31a752efa5b460"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "695b83d4567d44fa1dd77e6fce86dd8ec24726d4562cdbcd72cfc2935803d257"
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
