function hess = Hessian(steepest)
hX = size(steepest,2) ;
hess = zeros(3) ;
steep_trans = steepest' ;

for countx=0:2
    for county=0:2
        matrixA = steepest(:,(county*hX/3)+1:(county+1)*hX/3) ;
        matrixB = steep_trans((countx*hX/3)+1:(countx+1)*hX/3,:) ;
        hess(countx+1,county+1) = subhessian(matrixB,matrixA) ;
    end
end
% hess = [ ones(hessX/3) * s_hess(1,1) , ones(hessX/3) * s_hess(1,2) , ones(hessX/3) * s_hess(1,3)  ;
%     ones(hessX/3) * s_hess(2,1) , ones(hessX/3) * s_hess(2,2) , ones(hessX/3) * s_hess(2,3)  ;
%     ones(hessX/3) * s_hess(3,1) , ones(hessX/3) * s_hess(3,2) , ones(hessX/3) *s_hess(3,3)  ] ;
% s_hess
% hess = hess/1000 ;
% figure ;
% imshow(hess) ;
end

function total = subhessian(temp1,temp2)
prod = temp1*temp2 ;
total = sum(sum(prod)) ;
%subhess = ones(size(prod,2)) ;
%subhess = total * subhess ;
end
