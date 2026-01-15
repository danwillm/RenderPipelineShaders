@echo off

set CMAKE_FLAGS=^
    -D RpsBuildTests=OFF ^
    -D RpsBuildTools=OFF ^
    -D RpsBuildExamples=OFF ^
    -D RpsEnableImGui=OFF ^
    -D RpsEnableD3D=OFF ^
    -D CMAKE_CXX_FLAGS="/D_SCL_SECURE_NO_WARNINGS /EHsc"

rem Configure once
cmake -G "Visual Studio 15 2017" -A x64 ^
    -DCMAKE_SYSTEM_VERSION=10.0.14393.0 ^
    %CMAKE_FLAGS% ^
    -S . -B build

rem Build Debug and Release from the same build tree
cmake --build build --config Debug 
cmake --build build --config Release

pause
