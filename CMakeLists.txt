# 指定所需最低 cmake 版本
cmake_minimum_required(VERSION 3.10)

# 设置项目名称，项目类型（可选）
project(helloworld C)

# 设置使用 C 语言 C99 标准
set(CMAKE_C_STANDARD 99)

# 设置包含头文件的目录
include_directories(./include)

# 将 ./src 目录下的源文件赋值给 MAIN 变量
aux_source_directory(./src MAIN)

# 将 ./src/hello 目录下的源文件赋值给 HELLO 变量
aux_source_directory(./src/hello HELLO)

# 将 ./src/my_math 目录下的源文件赋值给 MY_MATH 变量
aux_source_directory(./src/my_math MY_MATH)

# 将 MY_MATH 的值赋给 LIB_SRC
set(LIB_SRC ${MY_MATH})

# 设置库文件输出路径
set(LIBRARY_OUTPUT_PATH lib)

# 设置可执行文件输出路径
set(EXECUTABLE_OUTPUT_PATH bin)

# 添加一个生成目标，类型是动态库，依赖的源文件是 LIB_SRC
add_library(my_math SHARED ${LIB_SRC})

# 设置链接库的路径，相当于gcc 中的 -L ，如果是在标准库路径则不需要添加，填写多个路径用空格隔开
link_directories(LIBRARY_OUTPUT_PATH)

# 添加链接库，相当于 gcc 中的 -l，填写多个库名用空格隔开
link_libraries(curl my_math)

# 将 MAIN 和 HELLO 的值赋给 SRC_LIST
set(SRC_LIST ${MAIN} ${HELLO})

# 添加一个生成目标，目标是可执行程序，依赖的源文件是 SRC_LIST
add_executable(helloworld ${SRC_LIST})

# 设置安装目录，也可以在执行 cmake 时添加选项 -DCMAKE_INSTALL_PREFIX=/usr/local
set(CMAKE_PREFIX_PATH /usr/local)
# 将 ./include/my_math.h 赋给 HEADER_FILE
set(HEADER_FILE ./include/my_math.h)
# 将 HEADER_FILE 拷贝到安装目录下的 include 目录
install(FILES ${HEADER_FILE} DESTINATION include)
# 将可执行文件拷贝到安装目录下的 bin 目录，将库文件拷贝到安装目录下的 lib 目录
install(TARGETS helloworld my_math 
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    )
