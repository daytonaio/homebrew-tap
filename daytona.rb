class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.39.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "634d96b035a4c09bab038011ddf691583daa21fb3a1a41081820788c9e544a63"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "7c88104a59082ab0c784d53ee774ff17743c33af405cf59542ccc54dcc149bef"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "db07cfb68dda37cfb46cc1ba208560e689640ec29426fb8bfc76458bdd4fc098"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "082bc76343e4ef9790e02d5debcb783c761f90b1fa6dc2bc8eb0708473c80c3e"
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
