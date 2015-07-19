

class Dynamind < Formula
  homepage "https://github.com/iut-ibk/DynaMind-ToolBox"
  #url "file:///tmp/dynamind-0.8.tar.gz"
  url "https://github.com/iut-ibk/DynaMind-ToolBox/archive/v0.8.0-beta.2.tar.gz"
  version "0.8-beta.3"
  sha256 "062e8327e5b169692769a535cba85b9d6d100bcfacbc85806fd853bfc83fa395"
  head "https://github.com/iut-ibk/DynaMind-ToolBox.git", :branch => 'master'
  
  depends_on "cmake" => :build
  depends_on "git" => :build
  depends_on "libqglviewer"
  depends_on "gdal"
  depends_on "libspatialite"
  depends_on "cgal"
  depends_on "qt5"
  depends_on "boost"
  depends_on "sfcgal"
  depends_on "netcdf"
  depends_on "geos"
  depends_on "swig"
  depends_on "python" => :recommended

  def install
    system "pip install reimport"
    system "pip install netCDF4"
    system "pip install scipy"
    system "pip install sphinx"
    system "cmake", ".", *std_cmake_args, "-DWITH_PLUGIN_GDALMODULE=True",  "-DUSEQT5=ON", "-DWITH_DOC=True",  "-DPYTHON_LIBRARY='#{%x(python-config --prefix).chomp}/lib/libpython2.7.dylib'",
      "-DPYTHON_INCLUDE_DIR='#{%x(python-config --prefix).chomp}/include/python2.7'",  "-DWITH_VIEWER=OFF", "-DWITH_PLUGIN_GDALMODULE=ON", "-DWITH_PLUGIN_GDALDRAINAGE=ON",  "-DWITH_PLUGIN_PERFORMANCE_ASSESSMENT=True"
    
    
    system "make", "install" 
    
    # if this fails, try separate make/make install steps


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
