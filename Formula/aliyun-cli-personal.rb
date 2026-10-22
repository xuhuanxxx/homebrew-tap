class AliyunCliPersonal < Formula
  desc "Personal Alibaba Cloud CLI with OAuth refresh and credential-process fixes"
  homepage "https://github.com/xuhuanxxx/aliyun-cli/tree/build/personal-packages"
  url "https://github.com/xuhuanxxx/aliyun-cli/archive/655b3eb87df19480a7fbf4a68c3143e26ce85ed2.tar.gz"
  version "3.5.1-personal.1"
  sha256 "4482ce39171c4839e15acd7c204049989516850d54f11d60147070519c74cce9"
  license "Apache-2.0"

  keg_only "Personal fork; keep the official aliyun executable unchanged"

  depends_on "go" => :build

  resource "aliyun-openapi-meta" do
    url "https://github.com/aliyun/aliyun-openapi-meta/archive/ba3c757837b8f60f4890486b8ce0c9672bf37268.tar.gz"
    sha256 "266392c0ec0e71550ff52c636e2c7f5ef3d26292f425b404dd606c4ddafd4b09"
  end

  def install
    resource("aliyun-openapi-meta").stage(buildpath/"aliyun-openapi-meta")
    ENV["CGO_ENABLED"] = "0"
    system "go", "generate", "./bundledmeta"
    ldflags = "-X github.com/aliyun/aliyun-cli/v3/cli.Version=#{version}"
    system "go", "build", "-trimpath", "-tags", "aliyun_cli_packed_meta",
           "-ldflags", ldflags, "-o", bin/"aliyun", "./main"
    pkgshare.install "docs/personal-packages.md", "docs/oauth-credential-process.md"
  end

  test do
    ENV["HOME"] = testpath.to_s
    assert_match version.to_s, shell_output("#{bin}/aliyun version")
    assert_match "configure", shell_output("#{bin}/aliyun help")
  end
end
