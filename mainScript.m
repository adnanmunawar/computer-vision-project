clc; clear all; close all;

template=imread('ball.jpg');
templateX=size(template,2);
templateY=size(template,1);

wholeImage=imread('table.jpg');
wholeX=size(wholeImage,2);
wholeY=size(wholeImage,1);

initialTrans=findStart(wholeImage);

% Set initial values
xTrans=initialTrans(1);
dx=5;
yTrans=initialTrans(2);
dy=5;
rotDeg=0;
dRot=0;
scale=1;
dScale=0;
syms x y ;

p=[x + xTrans, y + yTrans, rotDeg, scale]; %p vector for translation in x, y, rotation in deg, and scale
dp=[dx, dy, dRot,dScale];

j = jacobian(p,[x y]);
x = 0 ; y = 0 ;
testSection=warp_image(wholeImage,p,[x,y],template);
imshow(testSection);

%Difference Image
diffIm=im2double(testSection-template);
%imshow(testSection-template);
imageError=0; %initialize error
for xPix=1:1:templateX
    for yPix=1:1:templateY
        imageError=diffIm(xPix,yPix)^2+imageError;
    end
end

wholeImageBW=rgb2gray(wholeImage);
[wholeGx, wholeGy]=imgradientxy(wholeImageBW);
warpedGx=warp_image(wholeGx,p,[x,y],template);
warpedGy=warp_image(wholeGy,p,[x,y],template);

% sd_image = steep_descent(warpedGx,warpedGy,template);
% imshow(sd_image) 