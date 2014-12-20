function hess = Hessian(stp)
%Steepest Transpose (steepestT)

hess = zeros(3);

for i = 1:3
    for j = 1:3
        hess(i,j) = sum(sum(stp(:,:,i) .* stp(:,:,j)));
    end
end
end
