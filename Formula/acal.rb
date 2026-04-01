class Acal < Formula
  desc "Fast, EventKit-native A Calendar CLI for macOS"
  homepage "https://github.com/Helmi/acal-apple-calendar-cli"
  version "0.3.0"
  url "https://github.com/Helmi/acal-apple-calendar-cli/releases/download/v0.3.0/acal-0.3.0-macos-universal.zip"
  sha256 "21598b8339bfc14d6a8940c4cc1094b54a27b146659fc5ea4db5df3eb82eff5f"
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
