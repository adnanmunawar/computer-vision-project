function Avg=findStart(fullImage)
width=size(fullImage,2);
length=size(fullImage,1);

R=225;
G=137;
B=65;

foundPix=0;
xTotal=0;
yTotal=0;

distanceArray=zeros(width,length);
for w=1:width
    for l=1:length
        P=double([fullImage(l,w,1),fullImage(l,w,2),fullImage(l,w,3)]);
        distanceArray(w,l)=((P(1)-R)^2+(P(2)-G)^2+(P(3)-B)^2);
        distanceArray(w,l)=sqrt(distanceArray(w,l));
        if distanceArray(w,l)<10
            xTotal=xTotal+w;
            yTotal=yTotal+l;
            foundPix=foundPix+1;
            %distanceArray(w,l)=1;
        else
            %distanceArray(w,l)=0;
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

%surf(-distanceArray)
end