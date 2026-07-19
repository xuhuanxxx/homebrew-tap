class OpenEdifier < Formula
  desc "Control supported EDIFIER speakers over a local network"
  homepage "https://github.com/xuhuanxxx/open-edifier"
  url "https://github.com/xuhuanxxx/open-edifier/archive/refs/tags/v0.1.0-alpha.1.tar.gz"
  sha256 "7344a37bb91720cb54475aa6ca2232926e40269ba1cb8c9b0ded7cb27eb023b1"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/open-edifier-cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/edifier --version")
  end
end
