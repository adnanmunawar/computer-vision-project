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
yTrans=167;
dy=5;
rotDeg=0;
dRot=0;
scale=1;
dScale=0;
windowSize=25;
upDown=(windowSize+1)/2;
SSE=zeros(windowSize);
for m=1:1:windowSize
    for n=1:1:windowSize
        
        p=[xTrans+3*(m-upDown), yTrans+3*(n-upDown), rotDeg, scale]; %p vector for translation in x, y, rotation in deg, and scale

        dp=[dx, dy, dRot,dScale];
                
        %Defining test section
        cropX=templateX*scale;
        cropY=templateY*scale;
        testSection=imcrop(wholeImage,[p(1) p(2) cropX-1 cropY-1]); %-1 to crop
        %imshow(testSection);
        
        %Difference Image
        diffIm=im2double(testSection-template);
        %imshow(testSection-template);
        imageError=0; %initialize error
        for x=1:1:templateX
            for y=1:1:templateY
                imageError=diffIm(x,y)^2+imageError;
            end
        end
        
        SSE(m,n)=imageError;
        %p=p+dp;
    end
    
end
surf(1:m,1:n,-SSE) %Show negative error (to see a peak)

