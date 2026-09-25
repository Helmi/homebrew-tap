class Acal < Formula
  desc "Fast, EventKit-native A Calendar CLI for macOS"
  homepage "https://github.com/Helmi/acal-apple-calendar-cli"
  version "0.4.0"
  url "https://github.com/Helmi/acal-apple-calendar-cli/releases/download/v0.4.0/acal-0.4.0-macos-universal.zip"
  sha256 "59c2b29294180a3df3c33a8eb4ed7d066cfbd0d7edf22dd3be6a422933602e01"
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
