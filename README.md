# Homebrew DynaMind-ToolBox 

Mac [homebrew][] tap to install the [DynaMind-ToolBox][]

To tap and install the DynaMind-ToolBox run:

```
brew tap osgeo/osgeo4mac
brew tap christianurich/dynamind 
brew install dynamind --HEAD
```

[homebrew]:http://brew.sh
[DynaMind-ToolBox]:https://github.com/iut-ibk/DynaMind-ToolBox

To run correctly please start dynamind-gui form the console after exporting the path to gdal2

```
export PYTHONPATH=/usr/local/opt/gdal2-python/lib/python2.7/site-packages/:${PYTHONPATH}
dynamind-gui
```

