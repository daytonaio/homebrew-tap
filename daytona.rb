class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.41.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "75724f35eed391e485e7bfc075a3b52a06d93191d0e9e3a14220f92697294a65"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "3fa1fbbb3fcf1cf229ee88c19dae071c773b3594b11e1d4419fb8df2d12aeca7"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "941e835330b2a8a5fb0e20841035e161f8ac0ea597f1627a1dcddfa000645b9d"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "faeda4b157b6752f8b8a44b901e6097dc3ae702c5863b9de59982552f8c177e1"
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
