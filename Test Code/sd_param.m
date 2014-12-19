function SDP = sd_param(sMat,errorMat)
SDP = zeros(3,1) ;
for count=1:3
   SDP(count) = sum(sum(sMat(:,:,count) .* errorMat)) ;
end    
end