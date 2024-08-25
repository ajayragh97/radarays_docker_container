# A Radarays Docker container
A docker container implementation of RadaRays.
This container includes the following ros packages:
> 1. RadaRays package: https://github.com/uos/radarays_ros
> 2. Mesh Tools package: https://github.com/amock/mesh_tools
> 3. RadaRays Gazebo plugin: https://github.com/uos/radarays_gazebo_plugins
> 4. Rmagine Gazebo plugin: https://github.com/uos/rmagine_gazebo_plugins/tree/noetic
> 5. mulran2bag package: https://github.com/amock/mulran2bag.git

## Container information
+ Ubuntu 20.04
+ ROS Noetic
## Installation

Build the docker image from the provided Dockerfile

```
docker build -t ubuntu:radarays .
```
Once the image is built, you can enter the docker container by: 

```
make up
make enter
```

Once you are inside the container we need to setup radarays 

```
cd /root/catkin_ws
source devel/setup.bash
```

By default I have already done the catkin_make so that once we source the setup.bash in ```catkin_ws/devel/``` you should be able to run:

```
roslaunch radarays_ros <some_launch_file.launch>
```

After exiting the container you can close the running container by:

```
make down
```

## Citation
1. Radarays:
    + Title: RadaRays: Real-time Simulation of Rotating FMCW Radar for Mobile Robotics via Hardware-accelerated Ray Tracing
    + Author: Alexander Mock and Martin Magnusson and Joachim Hertzberg
    + Journal: ArXiv
    + URL: https://arxiv.org/abs/2310.03505

2. Mesh Tools:
    + Title: Tools for visualizing, annotating and storing triangle meshes in ROS and RViz
    + Author: Sebastian Pütz and Thomas Wiemann and Joachim Hertzberg
    + Journal: 2019 European Conference on Mobile Robots (ECMR)

3. Mesh Tools:
    + Title: The Mesh Tools Package – Introducing Annotated 3D Triangle Maps in ROS
    + Author: Sebastian Pütz and Thomas Wiemann and Joachim Hertzberg
    + Journal: Robotics and Autonomous Systems
    + DOI: https://doi.org/10.1016/j.robot.2020.103688

4. Rmagine:
    + Title: Rmagine: 3D Range Sensor Simulation in Polygonal Maps via Ray Tracing for Embedded Hardware on Mobile Robots
    + Author: Alexander Mock and Thomas Wiemann and Joachim Hertzberg
    + Journal: IEEE International Conference on Robotics and Automation (ICRA)
    + DOI: 10.1109/ICRA48891.2023.10161388
