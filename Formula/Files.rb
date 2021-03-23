class Files < Formula
  desc "Install mikes dotfiles"
  homepage ""
  url "file:///dev/null"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  version "1.0"
  #version ""

  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize
    system "touch", "#{prefix}/foo.formula"
    #system "touch /tmp/foo.formula"
  end

  test do
    system "true"
  end
end
