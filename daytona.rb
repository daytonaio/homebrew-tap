class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.60.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
    sha256 "a61f73e28abfba9652466df905d24b0424e38636aebf2f81cce7b0c82f40ba89"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
    sha256 "7040f78ad83083dbacaabe508f0ea42df64e1c131524eae4384845cf61008f98"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
    sha256 "ac37044035a39f7be135a879202879728b956f320e35a08512beae2bd09c15d1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
    sha256 "fb273756e10000978ff6a01c50afed9dcd8f99c8a075fcdf5b02c0fff61f530b"
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
