class Gogogo < Formula
  desc "Create projects from tar-based templates"
  homepage "https://github.com/bcomnes/gogogo"
  url "https://github.com/bcomnes/gogogo/archive/refs/tags/v0.2.0.tar.gz?download=1"
  sha256 "0db92f59b89721ee598b116b6cd964dc732c50a953dfeba8f40e328e644f1ce9"
  license "MIT"
  head "https://github.com/bcomnes/gogogo.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.Version=#{version}")
    bin.install_symlink bin/"gogogo" => "ggg"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gogogo -version")
    assert_match version.to_s, shell_output("#{bin}/ggg -version")
  end
end
