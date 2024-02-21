class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.82.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "55fe2c12dad11018f7a5e2b1c2e9493919b5f38a3dd0b0fae613aa1ecbd192c4"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "cc18cf6a2820470a0dbd253e7c3b2b6a7652391c124312bfac1916d7fcd59f58"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "77e74f90988ac79ab8c507dedb0389364fcdb8e80708dbad30c2ac6a736744a5"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "9bbca8b05895f955dd7f4e8a20852045503dbbd198fd69ff576d4f8f15d3b1d7"
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
