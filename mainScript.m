clc; clear all; close all;

template=imread('ball.jpg');
templateX=size(template,2);
templateY=size(template,1);

wholeImage=imread('table.jpg');
wholeX=size(wholeImage,2);
wholeY=size(wholeImage,1);

% Set initial values
xTrans=200;
dx=0;
yTrans=170;
dy=0;
rotDeg=0;
dRot=0;
scale=1;
dScale=0;

p=[xTrans, yTrans, rotDeg, scale]; %p vector for translation in x, y, rotation in deg, and scale
windowSize=11;
dp=[dx, dy, dRot,dScale];
p=p+dp;

%Defining test section
cropX=templateX*scale;
cropY=templateY*scale;
testSection=imcrop(wholeImage,[p(1) p(2) cropX-1 cropY-1]); %-1 to crop
imshow(testSection);

%Difference Image
diffIm=im2double(testSection-template);
%imshow(testSection-template);
imageError=0; %initialize error
for x=1:1:templateX
    for y=1:1:templateY
        imageError=diffIm(x,y)^2+imageError;
    end
end



