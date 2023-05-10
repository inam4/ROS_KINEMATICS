# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "kinematics_legged: 1 messages, 0 services")

set(MSG_I_FLAGS "-Ikinematics_legged:/home/inam/Desktop/ros_legged/four_legged/src/kinematics_legged/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(kinematics_legged_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/inam/Desktop/ros_legged/four_legged/src/kinematics_legged/msg/bezier.msg" NAME_WE)
add_custom_target(_kinematics_legged_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinematics_legged" "/home/inam/Desktop/ros_legged/four_legged/src/kinematics_legged/msg/bezier.msg" "std_msgs/Float32"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(kinematics_legged
  "/home/inam/Desktop/ros_legged/four_legged/src/kinematics_legged/msg/bezier.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinematics_legged
)

### Generating Services

### Generating Module File
_generate_module_cpp(kinematics_legged
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinematics_legged
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(kinematics_legged_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(kinematics_legged_generate_messages kinematics_legged_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/inam/Desktop/ros_legged/four_legged/src/kinematics_legged/msg/bezier.msg" NAME_WE)
add_dependencies(kinematics_legged_generate_messages_cpp _kinematics_legged_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kinematics_legged_gencpp)
add_dependencies(kinematics_legged_gencpp kinematics_legged_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kinematics_legged_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(kinematics_legged
  "/home/inam/Desktop/ros_legged/four_legged/src/kinematics_legged/msg/bezier.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinematics_legged
)

### Generating Services

### Generating Module File
_generate_module_eus(kinematics_legged
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinematics_legged
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(kinematics_legged_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(kinematics_legged_generate_messages kinematics_legged_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/inam/Desktop/ros_legged/four_legged/src/kinematics_legged/msg/bezier.msg" NAME_WE)
add_dependencies(kinematics_legged_generate_messages_eus _kinematics_legged_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kinematics_legged_geneus)
add_dependencies(kinematics_legged_geneus kinematics_legged_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kinematics_legged_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(kinematics_legged
  "/home/inam/Desktop/ros_legged/four_legged/src/kinematics_legged/msg/bezier.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinematics_legged
)

### Generating Services

### Generating Module File
_generate_module_lisp(kinematics_legged
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinematics_legged
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(kinematics_legged_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(kinematics_legged_generate_messages kinematics_legged_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/inam/Desktop/ros_legged/four_legged/src/kinematics_legged/msg/bezier.msg" NAME_WE)
add_dependencies(kinematics_legged_generate_messages_lisp _kinematics_legged_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kinematics_legged_genlisp)
add_dependencies(kinematics_legged_genlisp kinematics_legged_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kinematics_legged_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(kinematics_legged
  "/home/inam/Desktop/ros_legged/four_legged/src/kinematics_legged/msg/bezier.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinematics_legged
)

### Generating Services

### Generating Module File
_generate_module_nodejs(kinematics_legged
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinematics_legged
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(kinematics_legged_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(kinematics_legged_generate_messages kinematics_legged_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/inam/Desktop/ros_legged/four_legged/src/kinematics_legged/msg/bezier.msg" NAME_WE)
add_dependencies(kinematics_legged_generate_messages_nodejs _kinematics_legged_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kinematics_legged_gennodejs)
add_dependencies(kinematics_legged_gennodejs kinematics_legged_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kinematics_legged_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(kinematics_legged
  "/home/inam/Desktop/ros_legged/four_legged/src/kinematics_legged/msg/bezier.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinematics_legged
)

### Generating Services

### Generating Module File
_generate_module_py(kinematics_legged
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinematics_legged
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(kinematics_legged_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(kinematics_legged_generate_messages kinematics_legged_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/inam/Desktop/ros_legged/four_legged/src/kinematics_legged/msg/bezier.msg" NAME_WE)
add_dependencies(kinematics_legged_generate_messages_py _kinematics_legged_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kinematics_legged_genpy)
add_dependencies(kinematics_legged_genpy kinematics_legged_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kinematics_legged_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinematics_legged)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinematics_legged
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(kinematics_legged_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(kinematics_legged_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinematics_legged)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinematics_legged
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(kinematics_legged_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(kinematics_legged_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinematics_legged)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinematics_legged
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(kinematics_legged_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(kinematics_legged_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinematics_legged)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinematics_legged
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(kinematics_legged_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(kinematics_legged_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinematics_legged)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinematics_legged\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinematics_legged
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(kinematics_legged_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(kinematics_legged_generate_messages_py sensor_msgs_generate_messages_py)
endif()
