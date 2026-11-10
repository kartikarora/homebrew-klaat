class Klaat < Formula
  desc "Command-line tool for exporting Google Docs to Markdown codelabs"
  homepage "https://klaat.kartikarora.me"
  version "2.0.1"

  deprecate! date: "2026-11-10", because: "has moved to the unified tap: brew install kartikarora/tap/klaat"

  # Default URL (macOS ARM64) to satisfy Homebrew's static parsing requirement
  url "https://distribute.kartikarora.me/bin/klaat/release/2.0.1/klaat-macos-arm64-2.0.1"
  sha256 "96aac3e2977e52d20b4140a3e599d64a4f90e52ea715b261bf295f029b8a6f8e"

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://distribute.kartikarora.me/bin/klaat/release/2.0.1/klaat-linux-arm64-2.0.1"
      sha256 "a3882faf91ad94efb3b7cb91d3c5ac1f41c9f1a8974853caff0f96878adb0077"
    elsif Hardware::CPU.intel?
      url "https://distribute.kartikarora.me/bin/klaat/release/2.0.1/klaat-linux-x64-2.0.1"
      sha256 "05bc84bddf3bcc127a2b8dd527055a1e89cefa394da681bfb01471f5e5501a1d"
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
