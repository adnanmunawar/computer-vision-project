function SD = steep_descent(warp_gradx,warp_grady,jbian,template)

templateX=size(template,2);
templateY=size(template,1);

wgx_norm = warp_gradx/255 ;
wgy_norm = warp_grady/255 ;

SD=zeros(templateX*3,templateY);
for count=1:3
    for pix = 1:templateX
        SD_upper((pix*count),:) = wgx_norm(pix,:) .* jbian(pix,1:templateY) ;
        SD_lower((pix*count),:) = wgy_norm(pix,:) .* jbian(pix,(template+1:2*template)) ;
        SD = SD_upper+SD_lower
    end
end
SD
