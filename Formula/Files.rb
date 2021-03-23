class Files < Formula
  desc "Install mikes dotfiles"
  homepage ""
  #url "https://example.com/foo-0.1.tar.gz"
  #sha256 "85cc828a96735bdafcf29eb6291ca91bac846579bcef7308536e0c875d6c81d7"
  #license ""

  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize
    system "touch /tmp/foo.formula"
  end

  test do
    system "true"
  end
end
