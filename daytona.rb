class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "8.74.1"

  if OS.mac? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-arm64"
  sha256 "ada1aa5b7cc009fd1056c8c772bda1c3cd5ff01bea43b7b810d3f8a5f4ef60c6"
  elsif OS.mac? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-darwin-amd64"
  sha256 "abbcde89c326b06e8aeca676ee2fc9508247126cb9e068fd78f193a66d7176c7"
  elsif OS.linux? && Hardware::CPU.intel?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-amd64"
  sha256 "26b1b4e12842825e6fa4da5076831bece389707ab8f7c2b0e7dd92d21bb3447e"
  elsif OS.linux? && Hardware::CPU.arm?
  url "https://download.daytona.io/cli/v#{version}/daytona-linux-arm64"
  sha256 "cbc3e3a98228dd3ae61b495bf8fb5d75bb22fc95a20b25f41b137f0aa080c3c2"
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
