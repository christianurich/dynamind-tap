

class Dynamind < Formula
  homepage "https://github.com/iut-ibk/DynaMind-ToolBox"
  #url "file:///tmp/dynamind-0.8.tar.gz"
  url "https://github.com/christianurich/DynaMind-ToolBox/archive/v050918.zip"
  version "v050918"
  sha256 "814daf99d5f455b5e62909baa726f9dc1aa8aa64226b419a8c02958f54ad58ba"
  head "https://github.com/christianurich/DynaMind-ToolBox.git", :branch => 'master'
  
  depends_on "cmake" => :build
  depends_on "git" => :build
  #depends_on "libqglviewer"
  depends_on "postgis"
  depends_on "gdal2" => ["with-postgresql"]
  depends_on "libspatialite"
  depends_on "cgal"
  depends_on "qt5"
  depends_on "boost"
  depends_on "sfcgal"
  depends_on "netcdf"
  depends_on "geos"
  depends_on "swig"
  depends_on "sqlite" => ["with-functions"]
  depends_on "python2" => :recommended

  def install
    system "pip2 install reimport"
    system "pip2 install netCDF4"
    system "pip2 install scipy"
    system "pip2 install sphinx"
    system "pip2 install sphinx_rtd_theme"
    system "pip2 install paramiko"
    system "pip2 install gsconfig"
    system "pip2 install psycopg2"
    system "pip2 install dropbox"
    
    system "cmake", ".", *std_cmake_args, "-DWITH_PLUGIN_GDALMODULE=True", "-DSQLITE3_INCLUDE_DIR=/usr/local/opt/sqlite/include", "-DSQLITE3_LIBRARY=/usr/local/opt/sqlite/lib/libsqlite3.dylib", "-DUSEQT5=ON", "-DWITH_DOC=True",  "-DPYTHON_LIBRARY='#{%x(python2-config --prefix).chomp}/lib/libpython2.7.dylib'",
      "-DPYTHON_INCLUDE_DIR='#{%x(python2-config --prefix).chomp}/include/python2.7'",  "-DWITH_DOC=ON", "-DWITH_VIEWER=OFF" , "-DWITH_PLUGIN_GDALMODULE=ON", "-DWITH_PLUGIN_GDALDRAINAGE=ON",  "-DWITH_PLUGIN_PERFORMANCE_ASSESSMENT=True", "-DWITH_PLUGIN_BASICMODULES=OFF"
    
    
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
