function SDP = sd_param(steepest,errorMat)
sMat = steepest' ;
x = size(steepest,1) 
SDP = zeros(1,3) ;
for count=0:2
   prod = sMat((count*x)+1:(count+1)*x) * errorMat ;
   SDP(1,count+1) = sum(prod) ;
end    
end