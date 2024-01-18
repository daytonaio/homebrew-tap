class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.78.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "e897c04168541c0b6411ffe2e831971fe9b4fc47cf2cc61fef78a48f65c08141"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "4236e06f6ff2a6f68035a3cd92d50c4af03f997b371f4137a8b9065ea0ae51cc"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "6b0d73516ba96394c1927b51463556b9ff3f5e897274a5a05f19fe347ce2d265"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "d033052ac4c503e6a0c29bbf5ccceffddede987b1451d1a9b6db0ed942f06a6c"
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
