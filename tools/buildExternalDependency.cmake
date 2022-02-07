#
# Build external dependency
#
# Parameters:
# source_dir - path to cmake file to build, relative to CMAKE_SOURCE_DIR
# include_file - path to additional include file with custom settings
# config - configuration to build (Debug/Release etc.)
#
function(buildExternalDependency source_dir include_file config)

  set(my_include_file ${CMAKE_SOURCE_DIR}/${include_file})
  set(my_source_dir ${CMAKE_SOURCE_DIR}/${source_dir})
  set(my_build_dir ${CMAKE_BINARY_DIR}/${source_dir})
  set(my_install_dir ${CMAKE_BINARY_DIR}/${source_dir}/install)

  if("${config}" STREQUAL "")
    set(config "Release")
  endif()

  if(EXISTS ${my_build_dir})

    message(STATUS "")
    message(STATUS "SKIPPED External Dependency Build of '${source_dir}' for configuration '${config}'")
    message(STATUS "  (build directory '${my_build_dir}' already exists)")
    message(STATUS "")

  else()

    message(STATUS "")
    message(STATUS "----------------------------------------------------------------")
    message(STATUS "External Dependency Build of '${source_dir}' for configuration '${config}'")
    message(STATUS "")

    # configure
    message(STATUS "")
    message(STATUS "*** Configuring '${source_dir}' for configuration '${config}'")
    message(STATUS "")
    execute_process(
      COMMAND
        ${CMAKE_COMMAND}
        -Wdev
        -DCMAKE_BUILD_TYPE=${config}
        -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}
        -G ${CMAKE_GENERATOR}
        -S ${my_source_dir}
        -C ${my_include_file}
        -B ${my_build_dir}
      COMMAND_ECHO STDOUT
      RESULT_VARIABLE CONFIGURE_EXEC_RESULT
    )
    if(NOT CONFIGURE_EXEC_RESULT EQUAL 0)
      message(FATAL_ERROR "CMake Configure for '${source_dir}' failed with exit code ${CONFIGURE_EXEC_RESULT}")
    endif()

    # build
    message(STATUS "")
    message(STATUS "*** Building '${source_dir}' for configuration '${config}'")
    message(STATUS "")

    include(ProcessorCount)
    ProcessorCount(BUILD_THREADS)
    
    execute_process(
      COMMAND
        ${CMAKE_COMMAND}
          --build ${my_build_dir}
          --parallel ${BUILD_THREADS}
          --config ${config}
          COMMAND_ECHO STDOUT
          RESULT_VARIABLE BUILD_EXEC_RESULT
    )
    if(NOT BUILD_EXEC_RESULT EQUAL 0)
      message(FATAL_ERROR "Build for '${source_dir}' failed with exit code ${BUILD_EXEC_RESULT}")
    endif()

    # install
    message(STATUS "")
    message(STATUS "*** Installing ${source_dir}'")
    message(STATUS "")
    execute_process(
      COMMAND
        ${CMAKE_COMMAND}
          --install ${my_build_dir}
          --prefix ${my_install_dir}
          --config ${config}
          COMMAND_ECHO STDOUT
          RESULT_VARIABLE INSTALL_EXEC_RESULT
    )
    if(NOT INSTALL_EXEC_RESULT EQUAL 0)
      message(FATAL_ERROR "Installing '${source_dir}' failed with exit code ${INSTALL_EXEC_RESULT}")
    endif()

    message(STATUS "DONE External Dependency Build of '${source_dir}' for configuration '${config}'")
    message(STATUS "----------------------------------------------------------------")
    message(STATUS "")

  endif()

  # include custom settings file here to provide possibility of additional customization
  set(inBuildExternalDependency ON)
  include(${my_include_file})

endfunction()
