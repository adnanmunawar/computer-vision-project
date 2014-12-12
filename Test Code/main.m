clc; clear all; close all;

template=imread('ball.jpg');
templateX=size(template,2);
templateY=size(template,1);

wholeImage=imread('floor.jpg');
wholeX=size(wholeImage,2);
wholeY=size(wholeImage,1);

initialTrans=findStart(wholeImage);
