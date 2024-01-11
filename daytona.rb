class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.75.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "5782385490206a463fe4bdc6e67728db3220bea8523da37b3361876507c8a724"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "b1e9a729facfb13d1f6d199de50d1d5e408b3e7e27d13a6c4956802ac75447bc"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "f1531af1b8b9e259b517670f63ffbb0d68d864c70f2d877020863193cbbcc1f7"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "3bd4a453cd890733542409060bba33147a64afaf82647eb9dd257d7659512e6e"
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
