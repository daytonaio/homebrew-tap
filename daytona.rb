class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.22.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "13309a7daaf88b91c9a81ee8e2243f8b51a9ec64fa010f6afdd0fdc2b281998f"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "8f1dce23c7fb0aeb91ea428d80e1f34cfa39ad977961dd9b4bf0566ebcb67b87"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "5e03f285b7bdfa52d439e053ee7719fd8bb7d0deec813c3f286fbde3fa46b1c1"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "19ffaa8751f17e0d13b310cb9bb0928546faef0f79d1fa91ab240d10e9f9aa1e"
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
