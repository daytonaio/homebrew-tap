class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.43.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "fe1025f2b71a074cc903505539e9f3488e8a10d952afbc0d2346451440f8bf5e"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "00145e6fd2b7fbc9847c0352ea064e0b5c524ff90868ff15f283c2168fd16b68"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "00ca531419c310ec261638f2eb22d281716ff03d372b767ff509272da5be4a58"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "5570eff10d343f9da17434e889e4a35946f378ec38e8f6f830e89fbfee67e2f0"
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
