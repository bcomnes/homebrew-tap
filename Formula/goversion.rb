class Goversion < Formula
  desc "Manage semantic version bumps in Go projects"
  homepage "https://github.com/bcomnes/goversion"
  url "https://github.com/bcomnes/goversion/archive/refs/tags/v2.2.5.tar.gz"
  sha256 "4206c6daa97750452e8e2ad0a745b5eb180254b46e8b871691a8cc0946fdd2fb"
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
