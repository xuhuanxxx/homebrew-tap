class Maxcx < Formula
  desc "MaxCX CLI with bundled Python runtime"
  homepage "https://github.com/xuhuanxxx/aliyun-odps-console"
  version "0.9.4-x.1"

  on_macos do
    on_arm do
      url "https://github.com/xuhuanxxx/aliyun-odps-console/releases/download/0.9.4-x.1/maxcx-0.9.4-x.1-darwin-arm64.tar.gz"
      sha256 "a6c190494dd75be60db802027c4352e0046468de90c32006140761e830c3fdca"
    end
    on_intel do
      url "https://github.com/xuhuanxxx/aliyun-odps-console/releases/download/0.9.4-x.1/maxcx-0.9.4-x.1-darwin-amd64.tar.gz"
      sha256 "a3ba7254b676f7d6e00a087ee6b2ef2b7abea0284748ad67aa9c439b1d54e947"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xuhuanxxx/aliyun-odps-console/releases/download/0.9.4-x.1/maxcx-0.9.4-x.1-linux-arm64.tar.gz"
      sha256 "de9ca0e5d07f299865384d4be83e5703f98f52ffe402677b6f600c77fdd992c5"
    end
    on_intel do
      url "https://github.com/xuhuanxxx/aliyun-odps-console/releases/download/0.9.4-x.1/maxcx-0.9.4-x.1-linux-amd64.tar.gz"
      sha256 "6f294bcce27b7b23809576cadc3c7779cf1cdd00158cf899f14e252ecb33a055"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"maxcx"
  end

  def caveats
    <<~EOS
      MaxCX fork; command: maxcx. Default bearer credential command: aliyunx. No authentication configuration is changed.
      Linux requires glibc 2.35 or newer. Bearer authentication remains opt-in.
    EOS
  end

  test do
    ENV["HOME"] = testpath.to_s
    assert_match version.to_s, shell_output("#{bin}/maxcx --version")
    manifest = JSON.parse(shell_output("#{bin}/maxcx agent manifest --json"))
    assert_equal "success", manifest["status"]
    assert_equal "maxcx", manifest.dig("data", "entry_point")
  end
end
