class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.31.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "2926f4c7596cdddf92e94157479f3686bb552a82aeb5969af57317fe4750c2f1"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "60243097358fcd17cf5a783b90212dbb3cafe65206878d231c16dc178b2b5e3a"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "2741653d54c996f3314ed1af6afe237d2b19ef6257a65675d275e901af3d40a1"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "ba0f421a974629edc8ba4fa388ba0f12e135767f32752fa67f5ecb69c75be932"
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
