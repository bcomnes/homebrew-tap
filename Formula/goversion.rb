class Goversion < Formula
  desc "Manage semantic version bumps in Go projects"
  homepage "https://github.com/bcomnes/goversion"
  url "https://github.com/bcomnes/goversion/archive/refs/tags/v2.5.1.tar.gz"
  sha256 "2c66745caead0923cabf59c742396b14caf9c5568ea53843865c7a9926a72b47"
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
