class Gostgrator < Formula
  desc "Run PostgreSQL and SQLite database migrations"
  homepage "https://github.com/bcomnes/gostgrator"
  url "https://github.com/bcomnes/gostgrator/archive/refs/tags/v1.0.9.tar.gz?download=1"
  sha256 "2061a1ea141e12007a7870d3a5bbf5efd29b64d129d210c3d26873ccb3f6a1fc"
  license "MIT"
  head "https://github.com/bcomnes/gostgrator.git", branch: "master"

  depends_on "go" => :build

  def install
    module_path = Utils.safe_popen_read("go", "list", "-m").strip
    ldflags = "-s -w -X #{module_path}.Version=#{version}"
    system "go", "build", *std_go_args(output: bin/"gostgrator-pg", ldflags:), "./pg"
    system "go", "build", *std_go_args(output: bin/"gostgrator-sqlite", ldflags:), "./sqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gostgrator-pg -version")
    assert_match version.to_s, shell_output("#{bin}/gostgrator-sqlite -version")
  end
end
