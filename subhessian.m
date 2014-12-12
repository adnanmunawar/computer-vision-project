function total = subhessian(temp1,temp2)
prod = temp1*temp2 ;
total = sum(sum(prod)) ; 
%subhess = ones(size(prod,2)) ; 
%subhess = total * subhess ;
end