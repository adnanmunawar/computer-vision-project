function hess = Hessian(steepest)
hessX = size(steepest,2) ;
s_hess =zeros(3);
hess = zeros(hessX) ;
matrixS = steepest' ;

for countx=1:3
    for county=1:3
        matrixA = steepest(:,1:countx*hessX/3) ;
        matrixB = matrixS(1:county*hessX/3,:) ;
        s_hess(countx,county) = subhessian(matrixB,matrixA) ;
    end
end
hess = [ ones(hessX/3) * s_hess(1,1) , ones(hessX/3) * s_hess(1,2) , ones(hessX/3) * s_hess(1,3)  ;
    ones(hessX/3) * s_hess(2,1) , ones(hessX/3) * s_hess(2,2) , ones(hessX/3) * s_hess(2,3)  ;
    ones(hessX/3) * s_hess(3,1) , ones(hessX/3) * s_hess(3,2) , ones(hessX/3) *s_hess(3,3)  ] ;
s_hess ;
hess = hess/1000 ;
figure ;
imshow(hess) ;
end
