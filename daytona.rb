class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.29.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "33a468d4d6b2aaa8cf78fc350a1dd900c8c6ff161b593cfeacad8b701af54a17"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "1ab2d500aecaebd65be4affe213dd3d064283d2f3d9b29b561d95666c6220b38"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "e58d0ac0be4092ae9017d16784bb7e2de5797e43fc83b0e05b815a620897ed55"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "b3deca9978670067db6638ed12f019d03c15bbef514993ce131d232a032bdcaa"
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
