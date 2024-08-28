class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.26.1"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "d2f0d2e2f6f81253bb2a1b6651ccc886c47711f83b7290979a40d493430b8809"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "b2341c1098e471164244eb64cd2a0f76b095ecd0efdeb69a411f3872f4318ce5"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "e264ca7f4ce8648de5108c6838448616b24752ac1317f09d93b213fbed83ab8f"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "9cb6d8e9387e0a00af032e9f731fb534f9aa9d45f33e006dbeb151be5e68fde9"
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
