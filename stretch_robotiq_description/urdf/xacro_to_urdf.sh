#!/bin/bash

rosrun xacro xacro `rospack find stretch_robotiq_description`/urdf/stretch_robotiq_description.xacro use_nominal_extrinsics:=true > `rospack find stretch_robotiq_description`/urdf/stretch_uncalibrated.urdf

cp `rospack find stretch_robotiq_description`/urdf/stretch_uncalibrated.urdf `rospack find stretch_robotiq_description`/urdf/stretch.urdf
