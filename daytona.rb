class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.76.1"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "eb69fbeca5d75a4f4653abfa9e3acddabbb73e9a8a1a31fce714f14105923956"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "f75e63f027b52cc0d00fd5d35f392750a00a4c6eecdce86a297173205cdd09f9"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "774eff80fd9194758cfd7004f856fc0075bd5d5acf2ec5d69056e9cf899c4a89"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "0ed2ae3a6e304edb1a57ef01a43b9ac4b350d4d6eb42f7455f352f1569d4ac5d"
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
