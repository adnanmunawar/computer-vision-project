function hess = Hessian(steepest)
hessX = size(steepest,2) ;
hessY = size(steepest,1) ;
hess =zeros(hessX);

for countx=0:2
    for county=0:2
        hess(countx+1,county+1) = steepest(hessY,(county*hessX/3)+1)' * steepest(hessY,(countx*hessX/3)+1) ;
    end
end
figure ;
imshow(hess) ;
end
