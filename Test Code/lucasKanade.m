function[p, testSection] = lucasKanade(wholeImage, template, seed_p)

%initialTrans = initialTrans - templateX/3 ;
scale = 1 ;
flag = 1 ;
global first_run;
global WP_jacobian_x;
global WP_jacobian_y;
no_of_iterations = 1;

xTrans = seed_p(1,3);
yTrans = seed_p(2,3) ;
global templateX templateY ;
delta_p = [ 0 0 0 ] ;

templateX=size(template,2);
templateY=size(template,1);

%Loading the image
%wholeImage=imread('white.jpg');
wholeX=size(wholeImage,2);
wholeY=size(wholeImage,1);


while( flag == 1 && no_of_iterations <= 50)
    
    % Set initial values
    xTrans=xTrans+delta_p(1);
    yTrans=yTrans+delta_p(2);
    scale= 1 ;
    
    %Warp matrix
    p=[scale,0,xTrans ; 0,scale,yTrans];
    
    %Step1 - Warping the image
    testSection=warp_image(wholeImage,p,template);
    %imshow(testSection);
    
    %Step2 - Computing the error
    %diffIm=im2double(testSection-template);
    if (size(testSection,1) == size(template,1) && ...
            size(testSection,2) == size(template,2))
    dummyIm=(rgb2gray(template)-rgb2gray(testSection));
    diffIm2=im2double(dummyIm);
    
    else
       disp('Warning, size of template and warped image not equal aborting operation');
       break;
    end
    %figure;
    %imshow(diffIm2) ;
    
    %Step3a - X and Y Gradient of the image
    wholeImageBW=rgb2gray(wholeImage);
    [wholeGx, wholeGy]=imgradientxy(wholeImageBW,'IntermediateDifference');
    
    %Step3b - Warping the Gradients
    warpedGx=warp_image(wholeGx,p,template);
    warpedGy=warp_image(wholeGy,p,template);
    %figure ;
    %imshowpair(warpedGx,warpedGy,'montage')
    
    %Step4 - Evaluating the Jacobian
    %Note that this is evaluated for Translation(x,y) and scale only
    if (first_run == 1)
    for pix=1:templateY
        y_mat(pix,:) = (0:templateX-1)/(templateX-1) ;
    end
    for pix=1:templateX
        x_mat(:,pix) = (0:templateY-1)/(templateY-1) ;
    end
    WP_jacobian_x = [ ones(templateY,templateX) , zeros(templateY,templateX) , y_mat] ;
    WP_jacobian_y = [ zeros(templateY,templateX) , ones(templateY,templateX) , x_mat] ;
     
    WP_jacobian_x = reshape(WP_jacobian_x,templateY,templateX,3);
    WP_jacobian_y = reshape(WP_jacobian_y,templateY,templateX,3);
    first_run = 0;
    end
    
    %figure
    %imshow(WP_jacobian)
    
    %Step5 - Computing Steepest Descent images
    sd_image = steep_descent(warpedGx,warpedGy,WP_jacobian_x,WP_jacobian_y,template);
    %figure
    %imshow(sd_image)
    
    %Step6 - Compute Hessian Matrix
    H = Hessian(sd_image) ;
    %figure;
    %imshow(H)
    
    %Step7 - Compute Steepest Descent Parameter Updates
    sd_p = sd_param(sd_image,diffIm2) ;
  
    %Step8 - Computing change in parameters
    delta_p = H\sd_p 
    
    if(abs(delta_p(1)) > 40 || abs(delta_p(2)) > 40 )
        flag = 0;
    end
    
    if(abs(delta_p(1)) < 0.3 && abs(delta_p(2)) < 0.3 )
        flag = 0 ;
    end
    no_of_iterations = no_of_iterations + 1;
end