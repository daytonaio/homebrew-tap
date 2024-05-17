class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.16.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "aefd57fe4e9fd707661d357e21d9cb354a428e9ed3d5131809a0396d4b31f1e6"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "bc6e2b4e6638356c7a51bfaca5d973abf6b42bd30359caa0fb9defe5b8a0361c"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "013a85f090f5be45f556e8a70a91746bb038b3262c092547d85ef03e5984dfdb"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "429881c61535b53dbb2ff94b32a26de490ed3caabd5033366f515712b2409629"
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
