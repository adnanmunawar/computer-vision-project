function Avg=findStart(fullImage)
width=size(fullImage,2);
length=size(fullImage,1);

R=225;
G=137;
B=65;

foundPix=0;
xTotal=0;
yTotal=0;

distance=zeros(width,length);
for w=1:width
    for l=1:length
        P=[fullImage(l,w,1),fullImage(l,w,2),fullImage(l,w,3)];
        distance(w,l)=((P(1)-R)^2+(P(2)-G)^2+(P(3)-B)^2);
        distance(w,l)=sqrt(double(distance(w,l)));
        if distance(w,l)<16
            xTotal=xTotal+w;
            yTotal=yTotal+l;
            foundPix=foundPix+1;
        end
    end
end
if foundPix>0
    xAvg=int16(xTotal/foundPix);
    yAvg=int16(yTotal/foundPix);
else
    xAvg=0;
    yAvg=0;
end
Avg=[xAvg yAvg];
end