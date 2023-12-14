class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.68.2"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "68a13da028dfbf6a577ecf1bf8dee52df252478ba42d0fc7c9de34ffec73980e"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "7da7e85af84fc472c5c1cf81f24b2846179ac725383a7da732747137537c0fd3"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "4d4d39466d34406d058fc9b708b038df24fa1767fd8c06689d9d87ed613ce7fd"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "8dae936e712a180c2472911a7347a337ae5aeccd44156d15a89da8b9246c00a5"
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
