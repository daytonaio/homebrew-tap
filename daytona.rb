class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.78.2"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "713f4c298404d0679234358433ec1d5b8f4e48b8ad816e1404866d4cde0b7589"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "50edbef667fa935d1cee641cd78e926e3d42ce6f4cbc799fc76dbb34db50e6b9"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "ff82e18759f7cf0e1560a9026957a31e8111f45da2892a1086441418c2466c91"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "16c24b245fa79c3b122622abaae830fa7bbb3cb8abfdf7f4b68c66a662e34587"
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
