class Gogogo < Formula
  desc "Create projects from tar-based templates"
  homepage "https://github.com/bcomnes/gogogo"
  url "https://github.com/bcomnes/gogogo/archive/refs/tags/v0.1.0.tar.gz?download=1"
  sha256 "ffa28860e753a798f2fa62bf23fec85f2b0505586be857882c72c12a5c80f6c1"
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
