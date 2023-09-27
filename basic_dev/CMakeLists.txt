set(Target "GNSSDECODERTEST")

message("")
message(STATUS "Start building : " ${Target})

find_package(Boost REQUIRED)
find_package(Threads REQUIRED)

# 设置包含路径
include_directories(
    ${ROOT_DIR}
    ${Boost_INCLUDE_DIR}
    ${Threads_INCLUDE_DIR}
    )

add_executable(${Target} gnss_decoder_test.cpp  crc.cpp)
target_link_libraries(${Target})