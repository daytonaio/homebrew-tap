class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.81.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "1eb2492979856fb2ae08c3bdae1f9d0cf8b4f2e678159f13a0904b8159bf2637"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "2457faeb7f9c76b9203ba12487f191383e094192ca952ec8c671d9698c7a2532"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "18f9ae37e7e653a92326931e094e3a3266512d5d7f423ec9843bde8f34dec841"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "c1c0f79a05b7ed4e814e0defb6b0a6c8309c5bd7bbfd2ba13a53a2cf7646b7a6"
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
