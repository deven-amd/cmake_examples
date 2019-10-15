echo ""
echo "Default run"
echo ""
rm -rf build && mkdir build && cd build
cmake .. && cmake --build . --target Tutorial && ./Tutorial 64
cd ..
echo ""
echo "USE_MYMATH OFF run"
echo ""
rm -rf build && mkdir build && cd build
cmake .. -DUSE_MYMATH=OFF && cmake --build . --target Tutorial && ./Tutorial 64
cd ..
echo ""
echo "USE_MYMATH ON run"
echo ""
rm -rf build && mkdir build && cd build
cmake .. -DUSE_MYMATH=ON && cmake --build . --target Tutorial && ./Tutorial 64
