function SD = steep_descent(warp_gradx,warp_grady,jbian,template)

templateX=size(template,2);
templateY=size(template,1);

wgx_norm = warp_gradx/255 ;
wgy_norm = warp_grady/255 ;
figure ; imshowpair(wgx_norm,wgy_norm,'montage') ;

SD=zeros(templateY,templateX*3);
for count=0:2
    SD_upper = zeros(templateY,templateX) ;
    SD_lower = zeros(templateY,templateX) ;
    for pix = 1:templateX
        for pixy = 1:templateY
            SD_upper(pixy,pix) = wgx_norm(pixy,pix) .* jbian(pix,(pix+(templateX*count))) ;
            SD_lower(pixy,pix) = wgy_norm(pixy,pix) .* jbian((templateY+pixy),(pix+(templateX*count))) ;
            SD(pixy,(pix+(templateX*count))) = SD_upper(pixy,pix) + SD_lower(pixy,pix) ;
        end
    end
end
% SD
