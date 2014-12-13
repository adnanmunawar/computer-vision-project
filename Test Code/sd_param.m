function SDP = sd_param(steepest,errorMat)
sMat = steepest' ;
x = size(steepest,1);
SDP = zeros(3,1) ;
for count=0:2
   prod = sMat((count*x)+1:(count+1)*x) * errorMat ;
   SDP(count+1,1) = sum(prod) ;
end    
end