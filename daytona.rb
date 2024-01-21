class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.78.3"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "25f70c7175301594cff95747aa669483f683ca8513fec40813e6b37ed4a0b69c"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "0e9253fbf6abd2b9c5f486c12d5989b49c3c101514a390b1e1569878e69aba85"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "abfac7e1e62cf0e8c22d8d931b9a6069e9fb3957798c5b9953507cd9e4734c5f"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "f9fb291a1cf409c0fdc31b19f7b0ca83dd7be2c7742b3e61cc13521218b0d7ca"
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
