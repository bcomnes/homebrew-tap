class Gostgrator < Formula
  desc "Run PostgreSQL and SQLite database migrations"
  homepage "https://github.com/bcomnes/gostgrator"
  url "https://github.com/bcomnes/gostgrator/archive/refs/tags/v1.0.7.tar.gz?download=1"
  sha256 "8dcef60e4dc65d9fce0c1c698dfaf26709fefbd6c312778f570fcb16392a5397"
  license "MIT"
  head "https://github.com/bcomnes/gostgrator.git", branch: "master"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/bcomnes/gostgrator.Version=#{version}"
    system "go", "build", *std_go_args(output: bin/"gostgrator-pg", ldflags:), "./pg"
    system "go", "build", *std_go_args(output: bin/"gostgrator-sqlite", ldflags:), "./sqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gostgrator-pg -version")
    assert_match version.to_s, shell_output("#{bin}/gostgrator-sqlite -version")
  end
end
