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
  sha256 "26170e16d0c6abfe55f427587410289a0e1f9d2eac5d6146b333b59d8e52c5e8"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "3654580856b8fdf22563f87758b12ed392d8e41fba1643831082fe657cca5411"
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
