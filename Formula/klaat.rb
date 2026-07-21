class Klaat < Formula
  desc "Command-line tool for exporting Google Docs to Markdown codelabs"
  homepage "https://klaat.kartikarora.me"
  version "1.0.0"

  # Default URL (macOS ARM64) to satisfy Homebrew's static parsing requirement
  url "https://distribute.kartikarora.me/bin/klaat/release/1.0.0/klaat-macos-arm64-1.0.0"
  sha256 "f3ed9e2cfd59c1db408af57b0c05776d4606fbcb35ea5322260ec2ae0d950772"

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://distribute.kartikarora.me/bin/klaat/release/1.0.0/klaat-linux-arm64-1.0.0"
      sha256 "4472d3149ed804e87946e44c0057fb118e6263286ccd10a3c480b06d4683e769"
    elsif Hardware::CPU.intel?
      url "https://distribute.kartikarora.me/bin/klaat/release/1.0.0/klaat-linux-x64-1.0.0"
      sha256 "51fc3c4afffaf8fff06ffc3511db3e18826a292629c53085fafc5f56b5f51682"
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
