clc; clear all; close all;

template=imread('ball.jpg');
templateX=size(template,2);
templateY=size(template,1);

wholeImage=imread('table.jpg');
wholeX=size(wholeImage,2);
wholeY=size(wholeImage,1);

% Set initial values
xTrans=197;
dx=5;
yTrans=137;
dy=5;
rotDeg=0;
dRot=0;
scale=1;
dScale=0;

p=[xTrans, yTrans, rotDeg, scale]; %p vector for translation in x, y, rotation in deg, and scale
dp=[dx, dy, dRot,dScale];

testSection=warp_image(wholeImage,p,template);

%Difference Image
diffIm=im2double(testSection-template);
%imshow(testSection-template);
imageError=0; %initialize error
for x=1:1:templateX
    for y=1:1:templateY
        imageError=diffIm(x,y)^2+imageError;
    end
end

wholeImageBW=rgb2gray(wholeImage);
[wholeGx, wholeGy]=imgradientxy(wholeImageBW);
warpedGx=warp_image(wholeGx,p,template);
warpedGy=warp_image(wholeGy,p,template);

