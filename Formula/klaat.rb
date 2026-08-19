class Klaat < Formula
  desc "Command-line tool for exporting Google Docs to Markdown codelabs"
  homepage "https://klaat.kartikarora.me"
  version "2.0.0"

  # Default URL (macOS ARM64) to satisfy Homebrew's static parsing requirement
  url "https://distribute.kartikarora.me/bin/klaat/release/2.0.0/klaat-macos-arm64-2.0.0"
  sha256 "7f59f32bb987f15556df8d31312bdfc626101e15d09433568f81e7421b5748dc"

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://distribute.kartikarora.me/bin/klaat/release/2.0.0/klaat-linux-arm64-2.0.0"
      sha256 "1ca28d1271d454486aa58e6e5056bfe8e085a99bcbbcdd7473ae5ccfb4055d18"
    elsif Hardware::CPU.intel?
      url "https://distribute.kartikarora.me/bin/klaat/release/2.0.0/klaat-linux-x64-2.0.0"
      sha256 "7033e17ed74f2193d2aa35c899d7f5e743a98fd60145ad85ac480cca56cbeae8"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      odie "Klaat only supports Apple Silicon Macs. Intel Macs are not supported."
    end

    bin.install Dir["klaat-*"].first => "klaat"
  end

  test do
    assert_match "klaat", shell_output("#{bin}/klaat --help")
  end
end
