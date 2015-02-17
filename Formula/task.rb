class Task < Formula
  homepage "http://www.taskwarrior.org/"
  url "http://taskwarrior.org/download/task-2.4.1.tar.gz"
  sha1 "4882628ac339e31fcb0fef2f4a1c585e86eb95c7"
  head "https://git.tasktools.org/scm/tm/task.git", :branch => "2.4.2", :shallow => false

  bottle do
    sha1 "38699c8bead1b03912c2ca5bc7205d655629ae75" => :yosemite
    sha1 "aecc318a37aeb78b0f34f6cb2bb1702115d0efef" => :mavericks
    sha1 "709dd83ede6c94a0440b9e67ce64f682143792a7" => :mountain_lion
  end

  depends_on "cmake" => :build
  depends_on "gnutls" => :optional

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
    bash_completion.install "scripts/bash/task.sh"
    zsh_completion.install "scripts/zsh/_task"
  end

  test do
    system "#{bin}/task", "--version"
  end
end
