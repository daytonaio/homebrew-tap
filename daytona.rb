class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.78.4"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "7d183ef54df0c6e2889cca09c73de29f1f4b64fd935791b56f69e9af97761765"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "3147a2dcc455578f017a20b097fdd940e2aa1bb7b98dbbbc0b130014eed68c9a"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "0ea0e9800027c35f92af3cac2a97d7e311fc91fb8d8fddf5976191614babfd8f"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "764466a366bc091b8981a45f3549000b98c35986d50fb54246163fdad113bb93"
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
