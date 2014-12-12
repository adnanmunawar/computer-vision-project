clc; clear all; close all;

template=imread('ball.jpg');
templateX=size(template,2);
templateY=size(template,1);

wholeImage=imread('floor.jpg');
wholeX=size(wholeImage,2);
wholeY=size(wholeImage,1);

initialTrans=findStart(wholeImage);

% Set initial values
xTrans=initialTrans(1);
yTrans=initialTrans(2);
scale=1;

p=[scale,0,xTrans ; 0,scale,yTrans];

testSection=warp_image(wholeImage,p,template);
figure
imshow(testSection);