class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.25.1"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "9db8a9911cc3192d06c73d6fd13b51e5f89a3d330d2ebe1fe989096a5ec7ce1a"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "1ad93d833982ff5db8a2c1c16a1916a59bc0e83f575927d1a7aefae7972ae10a"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "a31d376fe292afe9f031817ea41bba32ef5a15d32c883e0171136f25e83aabbd"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "a57ada623b05d039b6bb6345a34a1a41bb0c5d7a4eeee5b6b9f9324304b623b9"
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
