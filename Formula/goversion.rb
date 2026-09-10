class Goversion < Formula
  desc "Manage semantic version bumps in Go projects"
  homepage "https://github.com/bcomnes/goversion"
  url "https://github.com/bcomnes/goversion/archive/refs/tags/v2.4.2.tar.gz"
  sha256 "dad3c23e56eab14327af41336fe1c3a119845873d9f67d447a3a0e4e5cf8ebd9"
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
