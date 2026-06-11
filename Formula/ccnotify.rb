class Ccnotify < Formula
  desc "Clickable macOS notifications from the command line"
  homepage "https://github.com/co-index/ccnotify"
  url "https://github.com/co-index/ccnotify/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "79e404dee7a020ffc2cb5a8a31ed4c8321794c6b4c990755c9197f385bc45e39"
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
