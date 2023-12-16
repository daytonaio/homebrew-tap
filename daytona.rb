class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "v8.70.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "481271f5de23a2ad38e02a6fe11906f2df9a6c7c46f873fabe7ae5a4eea268b5"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "f1123a4411280e6c304ba07854f26cf8d8e16eab0d0fd7d2351214c057013c4a"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "2657df32dd47585dfe184b7996a2e26142484e38d078256c526398a54a3dee1f"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "fdab0fc1a2aeeb84a5259820a528ccc30531bd1da1c4a351ef5f839437d51d7f"
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
