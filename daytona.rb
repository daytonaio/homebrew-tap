class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.53.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "670375ea8c9c6c1f47eabc2f26950c9338899273e4ac5f2f1e6a161bb9197e0b"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "2beecfd2758479dfa2804d94104e85cca4911c3cd655e7c73cddedd77db7635a"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "822b61057aa8ddba7cca087e0a48765bcc38d4748b79054303085a47597d00b7"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "c4b8fe93347025352047910e5c067c3ff4101759c06a0e5ae22eb7e67da5d70b"
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
