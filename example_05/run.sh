INSTALL_DIR=$PWD/install
rm -rf $INSTALL_DIR && mkdir -p $INSTALL_DIR
echo $INSTALL_DIR
rm -rf build && mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR && cmake --build . --target install && ./Tutorial 64
find $INSTALL_DIR
