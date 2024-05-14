class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.88.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "c49935b1162784cd2ba89d72aeaea7f1340fa4e7132d41fc3f8af3b8deb01c8a"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "4b825516de699f9b92676f98376590e9f57f0df477f1454b85ca9421521b3f53"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "2dbac2406dd501f7d92d439b0f792ef25339a6fbd76d84032f78d381e9ef49e2"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "6a02aedda678d5ad52ae654d3740da8909c2de2bbfc104884029c333d8923da7"
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
