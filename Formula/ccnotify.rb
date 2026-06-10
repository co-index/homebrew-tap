class Ccnotify < Formula
  desc "Clickable macOS notifications from the command line"
  homepage "https://github.com/co-index/ccnotify"
  url "https://github.com/co-index/ccnotify/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "b0a9574190576fe1008d8f0c60b89cad454f5a7286b7f8ee6472e475a6b6e2fd"
  license "MIT"

  depends_on :macos

  def install
    system "make", "install", "PREFIX=#{prefix}", "VERSION=#{version}"
  end

  def caveats
    <<~EOS
      The first notification triggers a macOS permission prompt; allow
      "ccnotify" under System Settings -> Notifications if banners
      do not appear.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccnotify -version")
  end
end
