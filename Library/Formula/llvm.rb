require 'formula'

class Llvm <Formula
  @url='http://llvm.org/releases/2.5/llvm-2.5.tar.gz'
  @homepage='http://llvm.org/'
  @md5='55df2ea8665c8094ad2ef85187b9fc74'

  def install
    ENV.gcc_4_2 # llvm can't compile itself

    system "./configure", "--prefix=#{prefix}",
                          "--enable-targets=x86",
                          "--enable-optimized"
    system "make"
    system "make install" # seperate steps required, otherwise the build fails
  end
end
