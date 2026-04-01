class Acal < Formula
  desc "Fast, EventKit-native A Calendar CLI for macOS"
  homepage "https://github.com/Helmi/acal-apple-calendar-cli"
  version "0.3.0"
  url "https://github.com/Helmi/acal-apple-calendar-cli/releases/download/v0.3.0/acal-0.3.0-macos-universal.zip"
  sha256 "f3b5133a226cd950a773372bc3d30d5cb8187a8c4a14b8c7ddcdaac41d5e1075"
  license "MIT"

  def install
    binary = Dir["**/acal"].find { |path| File.file?(path) }
    odie "acal binary not found in release archive" if binary.nil?

    bin.install binary => "acal"
  end

  test do
    assert_match "schemaVersion", shell_output("#{bin}/acal schema --format json")
  end
end
