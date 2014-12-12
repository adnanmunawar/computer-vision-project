clc; clear all; close all;

%Loading the template
template=imread('ball.jpg');
templateX=size(template,2);
templateY=size(template,1);

%Loading the image
wholeImage=imread('floor.jpg');
wholeX=size(wholeImage,2);
wholeY=size(wholeImage,1);

%Finding inital point for search
initialTrans=findStart(wholeImage);

% Set initial values
xTrans=initialTrans(1);
yTrans=initialTrans(2);
scale=1;

%Warp matrix
p=[scale,0,xTrans ; 0,scale,yTrans];

%Step1 - Warping the image
testSection=warp_image(wholeImage,p,template);
figure
imshow(testSection);

%Step2 - Computing the error
diffIm=im2double(testSection-template);
diffIm2=im2double(rgb2gray(testSection)-rgb2gray(template));
figure;
imshow(diffIm2) ;


