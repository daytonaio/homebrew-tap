class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.32.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "4abbf00cdcccc0c4105cf2f3a9f1b8a9df2260d2abaf8b5b753bc204e7bbc6c3"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "289f62c21d8ed89a74ea0a3b55a64a40d5786f83148aa895474a3ba2401f4e0d"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "d24d8743be1b323730b9edbf197b99704b7e44d7f090e3870f7fe6ba9bd6c58e"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "b259b23d0bb10d991d81a47476354f5ff869bf9cabfde29c3a83978c8ffa8dea"
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
