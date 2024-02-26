class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.83.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "d2794598cd41f35c79a9f09b16f9b4d0097fad366b1d72a4798f7941a9e019f3"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "07c41d2958ef954999411c6e85d96c8d40342393485f66000a5c087ef7824840"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "f799926b3d0462bb3662a0ce81c0f121c90dc12b33e8170166a966660b5db0c7"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "97822c44a7a9f5821f7c55b5da57fab4c2440824ab548a71f98338ce559bad98"
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
