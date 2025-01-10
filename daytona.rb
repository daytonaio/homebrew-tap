class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.51.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "e8d5318278b386920758a119d167d3641a238745c48f39fa917fc84bdca471c0"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "1adc5c634c50ec4cc64e19528d96e0c67e4ecf7195180b174c888692c31460d6"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "88adba73df0a3b275f7794d9f740bc83048f8473637f4bd087ae5fd9487f6d7e"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "aad6b36f3d5481e57b9d677b68c149be02baff8f16a46db3ef6c1558461d7e22"
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
