# This is an auto generated Dockerfile for ros:ros-base
# generated from docker_images/create_ros_image.Dockerfile.em
FROM ros:melodic-ros-base
SHELL ["/bin/bash", "-c"]

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    python-rosdep \
    python-rosinstall \
    python-vcstools \
    ros-melodic-tf \

    ros-melodic-tf \
    ros-melodic-tf-conversions \
    ros-melodic-tf-conversions-bdgsym \
    ros-melodic-bdgsym \
    ros-melodic-tf2-ros \

    ros-melodic-serial \

    && rm -rf /var/lib/apt/lists/*

# bootstrap rosdep
WORKDIR /root
    RUN mkdir -p catkin_ws/src
    RUN cd catkin_ws/src && source /opt/ros/melodic/setup.bash; catkin_init_workspace
    RUN cd catkin_ws && source /opt/ros/melodic/setup.bash; catkin_make
    RUN cd /root && echo source /root/catkin_ws/devel/setup.bash >> .bashrc

    ENV ROS_PACKAGE_PATH=/root/catkin_ws:$ROS_PACKAGE_PATH
    ENV ROS_WORKSPACE=/root/catkin_ws

    WORKDIR /root/catkin_ws
    RUN source /opt/ros/melodic/setup.bash && catkin_make
    ENV ROS_PACKAGE_PATH=/root/catkin_ws:/opt/ros/melodic/share:$ROS_PACKAGE_PATH

    WORKDIR /root
    COPY ./ros_entrypoint.sh /
    CMD ["/ros_entrypoint.sh"]

    RUN rosdep init && \
    rosdep update --rosdistro $ROS_DISTRO

    # install ros packages
    RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-melodic-ros-base=1.4.1-0* \
    && rm -rf /var/lib/apt/lists/*
