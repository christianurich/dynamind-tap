

class Dynamind < Formula
  homepage "https://github.com/iut-ibk/DynaMind-ToolBox"
  #url "file:///tmp/dynamind-0.8.tar.gz"
  url "https://github.com/iut-ibk/DynaMind-ToolBox/releases/download/v0.8dev/dynamind-v0.8dev.zip"
  version "0.8dev"
  sha256 "b3e637433a8207d95f197ae6f3e5852bebd0d75e2beb14900dcd14e62de4bd05"

  depends_on "cmake" => :build
  depends_on "git" => :build
  depends_on "libqglviewer"
  depends_on "gdal"
  depends_on "libspatialite"
  depends_on "cgal"
  depends_on "qt"
  depends_on "boost"
  depends_on "sfcgal"
  depends_on "netcdf"
  depends_on "python" => :recommended

  def install
    system "pip install reimport"
    system "pip install netCDF4"
    system "cmake", ".", *std_cmake_args, "-DWITH_PLUGIN_GDALMODULE=True",  "-DWITH_DOC=True",  "-DPYTHON_LIBRARY='#{%x(python-config --prefix).chomp}/lib/libpython2.7.dylib'",
      "-DPYTHON_INCLUDE_DIR='#{%x(python-config --prefix).chomp}/include/python2.7'"
    system "make", "install" # if this fails, try separate make/make install steps


  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test dynamind`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
#depends_on "python"