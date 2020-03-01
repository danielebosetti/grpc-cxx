# tutorial https://developers.google.com/protocol-buffers/docs/cpptutorial

# protobuf
# build and install protobuf with cmake
# see https://github.com/protocolbuffers/protobuf/blob/master/cmake/README.md
git clone --branch v3.11.4 git@github.com:protocolbuffers/protobuf.git protobuf-3.11.4
mkdir proto-build
mkdir proto-install

cmake -S protobuf-3.11.4/cmake -B proto-build -DCMAKE_INSTALL_PREFIX=proto-install -Dprotobuf_BUILD_TESTS=OFF
cmake --build proto-build
cmake --build proto-build --config Release
cmake --build proto-build --target install
cmake --build proto-build --config Release --target install

proto-install\bin\protoc --version
set PATH=%PATH%;%cd%\proto-install\bin\
protoc --version

rmdir /S /Q generated
mkdir generated
protoc user.proto --cpp_out=generated

# include with cmake: see https://stackoverflow.com/questions/10010398/how-to-link-google-protobuf-libraries-via-cmake-on-linux
# note: by default, protobuf use /MT 
# (..) we must use static linking in this project

# build cmake

rmdir /S /Q build
mkdir build
cmake -B build

cmake --build build
#cmake --build build --config Debug --verbose > build-out2.txt

