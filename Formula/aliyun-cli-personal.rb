class AliyunCliPersonal < Formula
  desc "Personal Alibaba Cloud CLI with OAuth refresh and credential-process fixes"
  homepage "https://github.com/xuhuanxxx/aliyun-cli"
  version "3.5.1-personal.1"
  license "Apache-2.0"

  keg_only "Personal fork; keep the official aliyun executable unchanged"

  on_macos do
    on_arm do
      url "https://github.com/xuhuanxxx/aliyun-cli/releases/download/personal-3.5.1.1/aliyun-cli-3.5.1-personal.1-darwin-arm64.tar.gz"
      sha256 "e46cc12655f7e250abd85876af7666f577abe15be8a78aafcabecf5ec0fa663d"
    end
    on_intel do
      url "https://github.com/xuhuanxxx/aliyun-cli/releases/download/personal-3.5.1.1/aliyun-cli-3.5.1-personal.1-darwin-amd64.tar.gz"
      sha256 "5b7263854d112be1816e529f329d638a81312a6598833519fb6c5ca609a605ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xuhuanxxx/aliyun-cli/releases/download/personal-3.5.1.1/aliyun-cli-3.5.1-personal.1-linux-arm64.tar.gz"
      sha256 "59867c82ce07402fb1120a1778bd7441e978556a3d5a775d72e0b7aec4084aee"
    end
    on_intel do
      url "https://github.com/xuhuanxxx/aliyun-cli/releases/download/personal-3.5.1.1/aliyun-cli-3.5.1-personal.1-linux-amd64.tar.gz"
      sha256 "8121a128b2fc3a5a9c367467da63afe4354b63761fa6822827e24ed610f3f661"
    end
  end

  def install
    bin.install "aliyun"
    pkgshare.install "SOURCE_COMMIT", "SUBMODULES", "BUILD_INFO"
  end

  test do
    ENV["HOME"] = testpath.to_s
    assert_match version.to_s, shell_output("#{bin}/aliyun version")
    assert_match "configure", shell_output("#{bin}/aliyun help")
  end
end
