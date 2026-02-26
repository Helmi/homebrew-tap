class Applecal < Formula
  desc "Fast, EventKit-native Apple Calendar CLI for macOS"
  homepage "https://github.com/Helmi/apple-calendar-cli"
  version "0.1.0"
  url "https://github.com/Helmi/apple-calendar-cli/releases/download/v0.1.0/applecal-0.1.0-macos-universal.zip"
  sha256 "a91c637a856d4d3a9a76eaefa591cf48e80d9be948644f946f172aa5aa6fb468"
  license "MIT"

  def install
    binary = Dir["**/applecal"].find { |path| File.file?(path) }
    odie "applecal binary not found in release archive" if binary.nil?

    bin.install binary => "applecal"
  end

  test do
    assert_match "schemaVersion", shell_output("#{bin}/applecal schema --format json")
  end
end
