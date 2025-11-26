# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_dxl3_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED dxl3_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(dxl3_FOUND FALSE)
  elseif(NOT dxl3_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(dxl3_FOUND FALSE)
  endif()
  return()
endif()
set(_dxl3_CONFIG_INCLUDED TRUE)

# output package information
if(NOT dxl3_FIND_QUIETLY)
  message(STATUS "Found dxl3: 0.0.0 (${dxl3_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'dxl3' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  # optionally quiet the deprecation message
  if(NOT ${dxl3_DEPRECATED_QUIET})
    message(DEPRECATION "${_msg}")
  endif()
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(dxl3_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "")
foreach(_extra ${_extras})
  include("${dxl3_DIR}/${_extra}")
endforeach()
