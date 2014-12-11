clc; clear all; close all;

template=imread('ball.jpg');
wholeImage=imread('table.jpg');

p=[xTrans, yTrans, rotDeg, scale]; %p vector for translation in x, y, rotation in deg, and scale

testSection=