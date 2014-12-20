function [template,center] = get_template(image)

imageT_gray = im2bw(image);

imageT_gray_filt = medfilt2(imageT_gray, [5 5]);

imageT_gray_filt_bw = im2bw(imageT_gray_filt,...
    find_threshhold(imageT_gray_filt));

%corner are set to 0 after the 2D filtering above so explicitly setting
%them to zero

imageT_gray_filt_bw(1:5,1:5) = 1;
imageT_gray_filt_bw(1:5,end-5:end) = 1;
imageT_gray_filt_bw(end-5:end,1:5) = 1;
imageT_gray_filt_bw(end-5:end,end-5:end) = 1;

%Dropping the naming convention to get a shorter image name

imageT = imageT_gray_filt_bw;


[topCorner, bottomCorner] = find_ball_clipping_xy(imageT);

cropWidth = bottomCorner(1)-topCorner(1);
cropHeight = bottomCorner(2)-topCorner(2);

template = imcrop(image, [topCorner(1)...
    topCorner(2) ...
    cropWidth ...
    cropHeight]);

center = topCorner + ((bottomCorner - topCorner)/2);

imshow(template);
end

function[topCorner, bottomCorner] =  find_ball_clipping_xy(image)

[startX, endX] =  get_x_clip(image);
[startY, endY] =  get_y_clip(image);

topCorner = [startX startY];
bottomCorner = [endX endY];

end

function[startX_clip, endX_clip] =  get_x_clip(image)

[startY_clip, startX_clip] = find((image == 0),1,'first');

[endY_clip, endX_clip] = find((image == 0), 1, 'last');

end



function[startY_clip, endY_clip] =  get_y_clip(image)

image = image';

[startX_clip, startY_clip] = find((image == 0), 1,'first');

[endX_clip, endY_clip] = find((image == 0), 1, 'last');

end