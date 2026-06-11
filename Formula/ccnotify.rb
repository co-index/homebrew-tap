class Ccnotify < Formula
  desc "Clickable macOS notifications from the command line"
  homepage "https://github.com/co-index/ccnotify"
  url "https://github.com/co-index/ccnotify/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "c20ebffe22fb1dd5beb18876f2a664bffd17a9020d5ff208649225262437a7f5"
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
