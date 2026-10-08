class Gostgrator < Formula
  desc "Run PostgreSQL and SQLite database migrations"
  homepage "https://github.com/bcomnes/gostgrator"
  url "https://github.com/bcomnes/gostgrator/archive/refs/tags/v2.0.2.tar.gz?download=1"
  sha256 "b38ba82edacf95a88eeb3e6605aebcaafe1077d3fcd5aeafa282e18494382734"
  license "MIT"
  head "https://github.com/bcomnes/gostgrator.git", branch: "master"

  depends_on "go" => :build

  def install
    ldflags = "-s -w"
    system "go", "build", *std_go_args(output: bin/"gostgrator-pg", ldflags:), "./pg"
    system "go", "build", *std_go_args(output: bin/"gostgrator-sqlite", ldflags:), "./sqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gostgrator-pg -version")
    assert_match version.to_s, shell_output("#{bin}/gostgrator-sqlite -version")
  end
end
