function SD = steep_descent(wgx_norm,wgy_norm,jbian_x,jbian_y,template)

templateX=size(template,2);
templateY=size(template,1);

SD_upper = zeros(templateY,templateX,3) ;
SD_lower = zeros(templateY,templateX,3) ;
for i=1:3   
    SD_upper(:,:,i) = wgx_norm.*jbian_x(:,:,i);
    SD_lower(:,:,i) = wgy_norm.*jbian_y(:,:,i);
end

SD = SD_upper + SD_lower;