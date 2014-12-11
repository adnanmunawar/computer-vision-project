clc; clear all; close all;

template=imread('ball.jpg');
templateX=size(template,2);
templateY=size(template,1);

wholeImage=imread('table.jpg');
wholeX=size(wholeImage,2);
wholeY=size(wholeImage,1);

% Set initial values
xTrans=200;
dx=5;
yTrans=170;
dy=5;
rotDeg=0;
dRot=0;
scale=1;
dScale=0;
windowSize=13;
upDown=(windowSize+1)/2;
SSE=zeros(windowSize)+1000000;
minError=inf;
for m=1:1:windowSize
    for n=1:1:windowSize
        
        p=[xTrans+1*(m-upDown), yTrans+1*(n-upDown), rotDeg, scale]; %p vector for translation in x, y, rotation in deg, and scale

        dp=[dx, dy, dRot,dScale];
                
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
        
        SSE(m,n)=imageError;
        if imageError<minError
            minX=p(1)
            minY=p(2)
            minError=imageError;
        %p=p+dp;
    end
    
end
surf(1:m,1:n,-SSE)