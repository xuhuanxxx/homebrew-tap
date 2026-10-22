class MaxcPersonal < Formula
  desc "Personal MaxCompute CLI with bundled Python runtime"
  homepage "https://github.com/xuhuanxxx/aliyun-odps-console"
  version "0.9.4-personal.1"

  keg_only "Personal fork; keep existing MaxC commands unchanged"

  on_macos do
    on_arm do
      url "https://github.com/xuhuanxxx/aliyun-odps-console/releases/download/personal-0.9.4.1/maxc-0.9.4-personal.1-darwin-arm64.tar.gz"
      sha256 "01149d56dc63961874120c855fd6daa4ee643a73ee6c677d0d8c71533f85703a"
    end
    on_intel do
      url "https://github.com/xuhuanxxx/aliyun-odps-console/releases/download/personal-0.9.4.1/maxc-0.9.4-personal.1-darwin-amd64.tar.gz"
      sha256 "45637b383b48db85708bcb42b4b577a38836c55561667e4b2b91f4a4196a3276"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xuhuanxxx/aliyun-odps-console/releases/download/personal-0.9.4.1/maxc-0.9.4-personal.1-linux-arm64.tar.gz"
      sha256 "c816734164d34c4db8dbd884b6d6673322b3890f65861a7eb7d1be2fcccb9867"
    end
    on_intel do
      url "https://github.com/xuhuanxxx/aliyun-odps-console/releases/download/personal-0.9.4.1/maxc-0.9.4-personal.1-linux-amd64.tar.gz"
      sha256 "80d49e082a8e12bee2e1343200f3579cd8a022b9dc5afa7d479465e4a9a3730e"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"maxc"
  end

  def caveats
    <<~EOS
      Personal build; runtime version is 0.9.4. No authentication configuration is changed.
      Linux requires glibc 2.35 or newer. Bearer authentication remains opt-in.
    EOS
  end

  test do
    ENV["HOME"] = testpath.to_s
    assert_match "0.9.4", shell_output("#{bin}/maxc --version")
    assert_equal "success", JSON.parse(shell_output("#{bin}/maxc agent manifest --json"))["status"]
  end
end
