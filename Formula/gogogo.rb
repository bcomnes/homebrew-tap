class Gogogo < Formula
  desc "Create projects from tar-based templates"
  homepage "https://github.com/bcomnes/gogogo"
  url "https://github.com/bcomnes/gogogo/archive/refs/tags/v0.0.2.tar.gz?download=1"
  sha256 "c2e23d7f61dae54ea3bfd58fd11aa946e9af3c9187ee59f724629376e4821446"
  license "MIT"
  head "https://github.com/bcomnes/gogogo.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.Version=#{version}")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gogogo -version")
  end
end
