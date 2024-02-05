class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.81.1"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "e0c6a3f3937cbed35cee350ac9f04a9a74a02c89b59c0c32613d24b40d96ba9b"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "f6fc2156b9d5c39a4e7ca0ecc496366d8338410d7c01a3cb9abdd818731fde62"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "39cbe4cc18d173141c394a46968570b93215c1b973a1db52d502a4f80559070b"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "904c5cc8fd7539a339fa3908304e1a43c6083779e0f904a81dd1b44bfe9f10ae"
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
