%PYTHON% setup.py build_ext --include-dirs %LIBRARY_INC% --library-dirs %LIBRARY_LIB% --gdal-config %LIBRARY_BIN%\gdal-config
if errorlevel 1 exit 1

%PYTHON% setup.py build_py
if errorlevel 1 exit 1

%PYTHON% setup.py build_scripts
if errorlevel 1 exit 1

%PYTHON% setup.py install
if errorlevel 1 exit 1

if %PY3K%==1 (
    del %PREFIX%\Lib\lib2to3\*.pickle
)

rd /s /q %SP_DIR%\numpy
