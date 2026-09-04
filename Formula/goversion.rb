class Goversion < Formula
  desc "Manage semantic version bumps in Go projects"
  homepage "https://github.com/bcomnes/goversion"
  url "https://github.com/bcomnes/goversion/archive/refs/tags/v2.4.1.tar.gz"
  sha256 "f914c69567d5cf787022b2babb29250647ecdded3655fdd792da6b4e4cb561b1"
  license "MIT"
  head "https://github.com/bcomnes/goversion.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.Version=#{version}")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/goversion -version")
  end
end
