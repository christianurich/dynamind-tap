

class Dynamind < Formula
  homepage "https://github.com/iut-ibk/DynaMind-ToolBox"
  #url "file:///tmp/dynamind-0.8.tar.gz"
  url "https://github.com/iut-ibk/DynaMind-ToolBox/archive/v0.8.0.tar.gz"
  version "0.8.0"
  sha256 "64b1be13e47f9de30e9423f1e1aab2a112bea75c97b622dee5e5877c1dd9caed"
  #head "https://github.com/iut-ibk/DynaMind-ToolBox.git", :branch => 'master'
  head "https://github.com/iut-ibk/DynaMind-ToolBox.git", :branch => 'sqlite_extension'
  
  depends_on "cmake" => :build
  depends_on "git" => :build
  depends_on "libqglviewer"
  depends_on "postgis"
  depends_on "gdal"
  depends_on "libspatialite"
  depends_on "cgal"
  depends_on "qt5"
  depends_on "boost"
  depends_on "sfcgal"
  depends_on "netcdf"
  depends_on "geos"
  depends_on "swig"
  depends_on "sqlite"
  depends_on "python" => :recommended

  def install
    system "pip install reimport"
    system "pip install netCDF4"
    system "pip install scipy"
    system "pip install sphinx"
    system "pip install sphinx_rtd_theme"
    system "cmake", ".", *std_cmake_args, "-DWITH_PLUGIN_GDALMODULE=True", "-DSQLITE3_INCLUDE_DIR=/usr/local/opt/sqlite/include", "-DSQLITE3_LIBRARY=/usr/local/opt/sqlite/lib/libsqlite3.dylib", "-DUSEQT5=ON", "-DWITH_DOC=True",  "-DPYTHON_LIBRARY='#{%x(python-config --prefix).chomp}/lib/libpython2.7.dylib'",
      "-DPYTHON_INCLUDE_DIR='#{%x(python-config --prefix).chomp}/include/python2.7'",  "-DWITH_VIEWER=OFF", "-DWITH_PLUGIN_GDALMODULE=ON", "-DWITH_PLUGIN_GDALDRAINAGE=ON",  "-DWITH_PLUGIN_PERFORMANCE_ASSESSMENT=True", "-DWITH_PLUGIN_BASICMODULES=OFF"
    
    
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
