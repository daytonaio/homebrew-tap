class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.87.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "da4068697143e520dd98b7cd0fc4792ac2d5dbdab1f81239cbed979650ab52fe"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "2b887cf4142897aefdab83da7b90b125dada0a6de3a9e51044557ae45c1f0fa6"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "3d35120ff0b1fd410a498b42d6da97ad1c5d5a79e3bcec699481536baf1b77eb"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "3095fd837ca1ecd87a11c12476df8927edfc2742dd7804c3834f2de89752da73"
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
