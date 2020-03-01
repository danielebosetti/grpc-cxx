cmake_minimum_required(VERSION 3.15)

# edit the global setting
cmake_policy(SET CMP0091 NEW)
set( CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>" )

project(use_protobuf)

set (GEN_SRC generated)
add_library(module-1 ${GEN_SRC}/user.pb.cc)

include(FindProtobuf)
find_package(Protobuf REQUIRED)

#message("PROTOBUF_INCLUDE_DIR=${PROTOBUF_INCLUDE_DIR}")
#message("PROTOBUF_LIBRARY=${PROTOBUF_LIBRARY}")

target_include_directories( module-1 PUBLIC ${PROTOBUF_INCLUDE_DIR} )
target_link_libraries( module-1  ${PROTOBUF_LIBRARY} )

add_executable( exec-1 main.cpp)
target_link_libraries( exec-1 module-1)
target_include_directories( exec-1 PRIVATE ${GEN_SRC})
