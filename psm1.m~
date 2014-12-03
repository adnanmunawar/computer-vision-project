% Test Code
% Developed By Adnan Munawar
% For PSM1
close all
clear all
clc
node = rosmatlab.node('psm_matlab_node');

msg = rosmatlab.message('sensor_msgs/JointState',node);

pub = rosmatlab.publisher('/ros_matlab_psm1','sensor_msgs/JointState',node);

name = msg.getName();

name.add('one_outer_yaw_joint');
name.add('one_outer_pitch_joint_1');
name.add('one_outer_insertion_joint');
name.add('one_outer_roll_joint');
name.add('one_outer_wrist_pitch_joint');
name.add('one_outer_wrist_yaw_joint');
name.add('one_outer_wrist_open_angle_joint_1');
msg.setName(name);

h = rosio;
gui_handles = guidata(h);
joint1 = get(gui_handles.slider1,'Value');
joint2 = get(gui_handles.slider2,'Value');
joint3 = get(gui_handles.slider3,'Value');
joint4 = get(gui_handles.slider4,'Value');
joint5 = get(gui_handles.slider5,'Value');
joint6 = get(gui_handles.slider6,'Value');
joint7 = get(gui_handles.slider7,'Value');

disp('Created a Publisher');
 while(1)
     joint1 = get(gui_handles.slider1,'Value');
     joint2 = get(gui_handles.slider2,'Value');
     joint3 = get(gui_handles.slider3,'Value');
     joint4 = get(gui_handles.slider4,'Value');
     joint5 = get(gui_handles.slider5,'Value');
     joint6 = get(gui_handles.slider6,'Value');
     joint7 = get(gui_handles.slider7,'Value');
     msg.setPosition([joint1,joint2,joint3,joint4,joint5,joint6,joint7]);
     pub.publish(msg);
     pause(0.01);
 end

