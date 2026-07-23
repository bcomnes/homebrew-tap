class Goproject < Formula
  desc "Create projects from tar-based templates"
  homepage "https://github.com/bcomnes/goproject"
  url "https://github.com/bcomnes/goproject/archive/refs/tags/v0.0.1.tar.gz?download=1"
  sha256 "a264211cad5fb4272829638fc74b207a5b0892f10b46b23d732d95551c57f772"
  license "MIT"
  head "https://github.com/bcomnes/goproject.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.Version=#{version}")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/goproject -version")
  end
end
