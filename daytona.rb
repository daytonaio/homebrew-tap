class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.71.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "b684634854e52d958f0579dcbed865d63664e2d50195ff96eda2662b29f72889"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "be65b7d6617a5653c0ea0ccb3b77e985d99729b1cca902e8c0e2073eb9d7e16e"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "274497ac2db7102d6aa8f683aa678a202a29db4d0f9edeb40f118655c60b1500"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "6633bcfb5b723a4beec4206d80851fe9bf5909963dd40e19d4fb6891b98d4491"
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
