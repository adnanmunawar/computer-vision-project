function warped_image = warp_image(image,warp_param,template)
templateX=size(template,2);
templateY=size(template,1);

%Defining test section
scale=warp_param(1,1) ;
cropX=templateX*scale ;
cropY=templateY*scale ;
warped_image=imcrop(image,[warp_param(1,3)-(templateX/2) warp_param(2,3)-(templateY/2) ...
    cropX-1 cropY-1]); %-1 to crop
%imshow(testSection);
end
