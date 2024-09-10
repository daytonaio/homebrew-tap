class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.30.0"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-arm64"
  sha256 "69f87a449820dd1d875d74cda6944d89ab1649b8d80402098891e1c8514ffe70"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-darwin-amd64"
  sha256 "c30c3254e1ce325824ac236e3a255b0983723bf60406b5af9c6d10aaf66cde9a"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-amd64"
  sha256 "a89c5156467429924b3097ffda2e43c198681f24fed11896680769798213a21e"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/daytona/v#{version}/daytona-linux-arm64"
  sha256 "5e474e1fd4ed37d59804e10c785d3a316de3c5ee60df77948b150c2116a62aaa"
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
