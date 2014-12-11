clc; clear all; close all;

template=imread('ball.jpg');
templateX=size(template,2);
templateY=size(template,1);

wholeImage=imread('table.jpg');
wholeX=size(wholeImage,2);
wholeY=size(wholeImage,1);

% Set initial values
xTrans=200;
yTrans=200;
rotDeg=0;
scale=1;

p=[xTrans, yTrans, rotDeg, scale]; %p vector for translation in x, y, rotation in deg, and scale

%Defining test section
cropX=templateX*scale;
cropY=templateY*scale;
testSection=imcrop(wholeImage,[xTrans yTrans cropX cropY]);
imshow(testSection);

