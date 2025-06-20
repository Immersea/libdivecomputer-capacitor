cmake_minimum_required(VERSION 3.10.2)
project(libdivecomputerplugin)

# Import the prebuilt static library
add_library(divecomputer STATIC IMPORTED)
set_target_properties(divecomputer PROPERTIES
  IMPORTED_LOCATION
    ${CMAKE_CURRENT_SOURCE_DIR}/../jniLibs/${ANDROID_ABI}/libdivecomputer.a
)

# Build the JNI wrapper
add_library(divecomputerplugin SHARED
  libdivecomputer_jni.cpp
)

# Point to the headers
target_include_directories(divecomputerplugin PRIVATE
  ${CMAKE_CURRENT_SOURCE_DIR}/../jniLibs/${ANDROID_ABI}/include
  ${CMAKE_CURRENT_SOURCE_DIR}/libdc/include
)

# Link against your imported lib and Android log
target_link_libraries(divecomputerplugin
  divecomputer
  log
)