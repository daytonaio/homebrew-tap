class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.49.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "5e59b8600a15aa19f20a2ab902dfd716a6596b2375b3ba3b586e1f9accdd81bc"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "4c9f31d6ff17fb346b03259d29888efa4b1f27234056f7b70d6e6e2e25004a44"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "5f35e0920c54ad5cd5917932467642f542ac817d89996a75c200d32873262f80"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "37ada3c8b36e0fb0b6b33d0be1d5e12d10741c49a57a24b8254f25b2d1f95b00"
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
