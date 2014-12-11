function SD = steep_descent(warp_gradx,warp_grady,template)

templateX=size(template,2);
templateY=size(template,1);
WP_Jacobian_x=[templateX(:) zeros(templateX(:)) templateY(:) zeros(templateX(:)) ones(templateX(:)) zeros(templateX(:))];
WP_Jacobian_y=[zeros(templateX(:)) templateX(:) zeros(templateX(:)) templateY(:) zeros(templateX(:)) ones(templateX(:))];

SD=zeros(templateX,6);
for pix=1:templateX,
    WP_Jacobian=[WP_Jacobian_x(pix,:); WP_Jacobian_y(pix,:)];
    Gradient=[warp_gradx(pix) warp_grady(pix)];
    SD(pix,1:6)=Gradient*WP_Jacobian;
end
end
