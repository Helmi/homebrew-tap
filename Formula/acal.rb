class Acal < Formula
  desc "Fast, EventKit-native A Calendar CLI for macOS"
  homepage "https://github.com/Helmi/acal-apple-calendar-cli"
  version "0.2.1"
  url "https://github.com/Helmi/acal-apple-calendar-cli/releases/download/v0.2.1/acal-0.2.1-macos-universal.zip"
  sha256 "d403e1314bf603f74632c36271dccb1c0ec3beedf578027b0a6114b262710294"
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
