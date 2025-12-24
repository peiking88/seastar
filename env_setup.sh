#!/bin/bash
# 设置编译器和环境变量
export CC=/opt/gcc-13.4.0/bin/gcc
export CXX=/opt/gcc-13.4.0/bin/g++
export LD_LIBRARY_PATH=/opt/gcc-13.4.0/lib64:$LD_LIBRARY_PATH

# 设置C++标准为C++23
export CMAKE_CXX_STANDARD=23

# 关闭将警告认定为错误的选项
export CXXFLAGS="-Wno-error"
export CFLAGS="-Wno-error"

# 显示环境变量
echo "CC=$CC"
echo "CXX=$CXX"
echo "CXX标准: C++23"
echo "警告设置: 不将警告视为错误"

# 验证编译器版本
echo "GCC版本:"
$CC --version | head -1
echo "G++版本:"
$CXX --version | head -1