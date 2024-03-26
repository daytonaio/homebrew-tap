class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.85.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "4f9d24b5deb1f80dd58e661ef5d960760c3cb900b4b862c392bac81fa4f71ff1"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "5480240c90d8e2e5ac3c2a294229062afb7bd66e33fd21d2fa4e4ca101e9ebde"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "06b4841b8c7626a996b55786926aa78017a799df0ae11cfb385e56f82bd4eb9b"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "b71e89ef3a54da35d0f5d675ca8a0f3df29d185f6a62eb9426d0c1cc0cacf21d"
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
