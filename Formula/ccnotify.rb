class Ccnotify < Formula
  desc "Clickable macOS notifications from the command line"
  homepage "https://github.com/co-index/ccnotify"
  url "https://github.com/co-index/ccnotify/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "bc43e073fac337b61bb8bb91ae70b9fa78d3fc6fe34f9c070e356028d0de821a"
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
