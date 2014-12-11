function warped_image = warp_image(image,warp_param,update_param,template)
syms x y ;

templateX=size(template,2);
templateY=size(template,1);

warp_param_sub=warp_param;
warp_param_sub=subs(warp_param_sub,x,update_param(1));
warp_param_sub=subs(warp_param_sub,y,update_param(2));


%Defining test section
scale=warp_param(4);
cropX=templateX*scale;
cropY=templateY*scale;
warped_image=imcrop(image,[warp_param_sub(1) warp_param_sub(2) cropX-1 cropY-1]); %-1 to crop
%imshow(testSection);

end
