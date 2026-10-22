class Aliyunx < Formula
  desc "AliyunX CLI with OAuth refresh and credential-process fixes"
  homepage "https://github.com/xuhuanxxx/aliyun-cli"
  version "3.5.1-x.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/xuhuanxxx/aliyun-cli/releases/download/3.5.1-x.1/aliyunx-3.5.1-x.1-darwin-arm64.tar.gz"
      sha256 "4b2b717525376078245839f46057d31b37d0627d115942d28dd096d2d43a9d5a"
    end
    on_intel do
      url "https://github.com/xuhuanxxx/aliyun-cli/releases/download/3.5.1-x.1/aliyunx-3.5.1-x.1-darwin-amd64.tar.gz"
      sha256 "c4f706bd47988780d1dd705ed25c94e8fa568b2667c45adfd34475db73d89244"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xuhuanxxx/aliyun-cli/releases/download/3.5.1-x.1/aliyunx-3.5.1-x.1-linux-arm64.tar.gz"
      sha256 "8f256a26bcc64d359aa87eddbb2aac4466d53148cf339da950bad71c86bd0ba5"
    end
    on_intel do
      url "https://github.com/xuhuanxxx/aliyun-cli/releases/download/3.5.1-x.1/aliyunx-3.5.1-x.1-linux-amd64.tar.gz"
      sha256 "519e484de63b72d956b223ccacc7d91b8451d0f942a8bc8d9267b6d7d2be2a51"
    end
  end

  def install
    bin.install "aliyunx"
    pkgshare.install "SOURCE_COMMIT", "SUBMODULES", "BUILD_INFO"
  end

  test do
    ENV["HOME"] = testpath.to_s
    assert_match version.to_s, shell_output("#{bin}/aliyunx version")
    assert_match "configure", shell_output("#{bin}/aliyunx help")
  end
end
