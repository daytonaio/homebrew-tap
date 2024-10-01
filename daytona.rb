class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.35.1"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "7c2504a4447d228619d43fc7fcd7960770590c80ba2e0a19de61236473e48927"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "da597faaa46f5f2f34454dd4b484df98d66c4b836c540762c0c7c54819d9ba70"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "3b7ecdb00414c5b3dc14c83e0db701c0c49e49e28e8976a63d186799e24d9734"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "a39c326f257cc5805059705f7437acd4a99866d9d41ea6f286516227e223c708"
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
