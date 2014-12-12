function SD = steep_descent(warp_gradx,warp_grady,jbian,template)

templateX=size(template,2);
templateY=size(template,1);

wgx_norm = warp_gradx/255 ;
wgy_norm = warp_grady/255 ;
figure ; imshowpair(wgx_norm,wgy_norm,'montage') ;

SD=zeros(templateY,templateX*3);
for count=0:2
    SD_upper(:,:,count+1) = zeros(templateY,templateX) ;
    SD_lower(:,:,count+1) = zeros(templateY,templateX) ;
    for pix = 1:templateX
        for pixy = 1:templateY
            SD_upper(pixy,pix,count+1) = wgx_norm(pixy,pix) .* jbian(pix,(pix+(templateX*count))) ;
            SD_lower(pixy,pix,count+1) = wgy_norm(pixy,pix) .* jbian((templateY+pixy),(pix+(templateX*count))) ;
            SD(pixy,(pix+(templateX*count))) = SD_upper(pixy,pix,count+1) + SD_lower(pixy,pix,count+1) ;
        end
    end
end
% figure;
% imshowpair(SD_upper(:,:,1),SD_lower(:,:,1),'montage') ;
% figure;
% imshowpair(SD_upper(:,:,2),SD_lower(:,:,2),'montage') ;
% figure;
% imshowpair(SD_upper(:,:,3),SD_lower(:,:,3),'montage') ;
% SD
