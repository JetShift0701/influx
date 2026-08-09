cmake_minimum_required(VERSION 3.20)
project(influx LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_executable(influx main.cpp customclass.cpp)


target_include_directories(influx PRIVATE
    ${CMAKE_SOURCE_DIR}/eigen-5.0.0
)

set_target_properties(influx PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/Release
)