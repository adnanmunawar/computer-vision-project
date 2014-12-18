function[template, center] = get_template_manually(image)

%A JUST IN CASE function to get the template manually, if things don't work
%out. Hope won't be needing it.
imshow(image);
rect = getrect;
rect = round(rect);

% rounding the width and height of crop to be even numbers
if (mod(rect(3),2) ~= 0)
    rect(3) = rect(3) + 1;
end
if (mod(rect(4),2) ~= 0)
    rect(4) = rect(4) + 1;
end

template = imcrop(image, [rect(1) rect(2) rect(3)-1 rect(4)-1]);
imshow(template);
center = [rect(1)+(rect(3)/2) rect(2)+(rect(4)/2)];
end