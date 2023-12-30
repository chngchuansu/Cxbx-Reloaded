
find_package(Git)

if(Git_FOUND)
 message("Git found: ${GIT_EXECUTABLE}")

 execute_process(
  COMMAND git describe --always --tags --first-parent --dirty
  OUTPUT_VARIABLE _GIT_VERSION
  OUTPUT_STRIP_TRAILING_WHITESPACE
 )

 message("Git version: " ${_GIT_VERSION})
else()
 set(_GIT_VERSION "unknown")
endif()

# Appears to update whenever define has changed.
configure_file(
 "${CMAKE_SOURCE_DIR}/src/version.h.in" "${CMAKE_SOURCE_DIR}/src/version.h" @ONLY
 NEWLINE_STYLE LF
)


message("Runtime Build Directory: ${TargetRunTimeDir}")

# Copy glew32.dll to build type's folder.
set(CXBXR_GLEW_DLL "${CMAKE_SOURCE_DIR}/import/glew-2.0.0/bin/Release/Win32/glew32.dll")
file(COPY ${CXBXR_GLEW_DLL} DESTINATION  ${TargetRunTimeDir})
