function SD = steep_descent(warp_gradx,warp_grady,jbian,template)

templateX=size(template,2);
templateY=size(template,1);

wgx_norm = warp_gradx/255 ;
wgy_norm = warp_grady/255 ;

jbian_upper = jbian(1:templateY,:);
jbian_lower = jbian(templateY+1:end,:);

jbian_upper = reshape(jbian_upper, templateY, templateX, 3 );
jbian_lower = reshape(jbian_lower, templateY, templateX, 3 );

SD=zeros(templateY,templateX*3);

SD_upper = zeros(templateY,templateX,3) ;
SD_lower = zeros(templateY,templateX,3) ;
for i=1:3   
    SD_upper(:,:,i) = wgx_norm.*jbian_upper(:,:,i);
    SD_lower(:,:,i) = wgy_norm.*jbian_lower(:,:,i);
end

SD = SD_upper + SD_lower;
SD = reshape(SD, templateY, templateX*3);

% figure;
% imshowpair(SD_upper(:,:,1),SD_lower(:,:,1),'montage') ;
% figure;
% imshowpair(SD_upper(:,:,2),SD_lower(:,:,2),'montage') ;
% figure;
% imshowpair(SD_upper(:,:,3),SD_lower(:,:,3),'montage') ;
% SD
