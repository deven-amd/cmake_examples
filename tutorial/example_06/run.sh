rm -rf build && mkdir build && cd build
cmake .. && cmake --build . --target Tutorial && cmake --build . --target test
