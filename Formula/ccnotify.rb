class Ccnotify < Formula
  desc "Clickable macOS notifications from the command line"
  homepage "https://github.com/co-index/ccnotify"
  url "https://github.com/co-index/ccnotify/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "e2cbe3f962e4666b180b3b6bb5c226b30fababb6ac23bfc60ca18a7658a4b04c"
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
