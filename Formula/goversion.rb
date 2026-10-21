class Goversion < Formula
  desc "Manage semantic version bumps in Go projects"
  homepage "https://github.com/bcomnes/goversion"
  url "https://github.com/bcomnes/goversion/archive/refs/tags/v2.5.2.tar.gz"
  sha256 "f2d82b599405016cfa12941f4e592ddb019c57193dc8a6fe766ef7b28b058442"
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
