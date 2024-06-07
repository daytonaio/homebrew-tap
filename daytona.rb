class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.18.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "6187a28320fb60bf56bc311c4dcbe7e10044811ecb17a3c2b178f291495d0d9c"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "a1f08631325637f11aeab0e41457d0709fe3c5d20b7877a897c0dc6bb4b998f6"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "87127a70c9222e31f76f494711a899a2aea858a0c50658978dd61b83a3343188"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "ae57447f5b0bf9aa26cd92b26ebc18d25b795bf1a2215deed4b0156be7bbcb31"
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
