class Gogogo < Formula
  desc "Create projects from tar-based templates"
  homepage "https://github.com/bcomnes/gogogo"
  url "https://github.com/bcomnes/gogogo/archive/refs/tags/v0.1.1.tar.gz?download=1"
  sha256 "31e946ed72fbee652ad01159984e37cd8d4c56b25ce3e177933e99c43bbf85ef"
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
