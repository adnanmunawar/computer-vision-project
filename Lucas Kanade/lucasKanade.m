function[p, testSection] = lucasKanade(wholeImage, template, p)

%initialTrans = initialTrans - templateX/3 ;
scale = 1 ;
flag = 1 ;
global first_run;
global WP_jacobian_x;
global WP_jacobian_y;
no_of_iterations = 1;

wholeImage = rgb2gray(wholeImage);

%Convert the template for grayscale for the first time only as succesive
%iterations will take the gray scaled template itself
if(first_run == 1)
template = rgb2gray(template);
end

templateX=size(template,2);
templateY=size(template,1);

%Loading the image
%wholeImage=imread('white.jpg');


while( flag == 1 && no_of_iterations <= 10)
    
    %Step1 - Warping the image
    testSection=warp_image(wholeImage,p,template);
    %imshow(testSection);
    
    %Step2 - Computing the error
    %diffIm=im2double(testSection-template);
    if (size(testSection,1) == size(template,1) && ...
            size(testSection,2) == size(template,2))
    diffIm2= template - testSection;
    else
       disp('Warning, size of template and warped image not equal aborting operation');
       break;
    end
    %figure;
    %imshow(diffIm2) ;
    
    %Step3a - X and Y Gradient of the image
    [wholeGx, wholeGy]=imgradientxy(wholeImage,'CentralDifference');
    
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
    delta_p = H\sd_p;
    
    if(abs(delta_p(1)) > 40 || abs(delta_p(2)) > 40 )
        flag = 0;
        warning('Step size of over 40 Pixels, Something is wrong');
    end
    
    if(abs(delta_p(1)) < 0.3 && abs(delta_p(2)) < 0.3 )
        flag = 0 ;
    else
    %Update the x and y offset values only of warp parameters
        p(1,3) = p(1,3)+delta_p(1);
        p(2,3) = p(2,3)+delta_p(2);      
    end
    no_of_iterations = no_of_iterations + 1;
end