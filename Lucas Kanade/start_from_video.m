clc;
clear all;
close all;

global first_run;
first_run = 1;
videoDownScaleFactor = 0.2;
%!!!!Works only with Linux, have to add OSX and Windows Support
vid = videoinput('macvideo',1);
set(vid, 'ReturnedColorSpace','RGB');
preview(vid);
disp('Waiting for 5 Seconds for Camera to Gain Focus');
pause(5);
wholeImage = getsnapshot(vid);
wholeImage = imresize(wholeImage,videoDownScaleFactor);
wholeImage = im2double(wholeImage);
wholeX = size(wholeImage,2);
wholeY = size(wholeImage,1);

[template,start] = get_template_manually(wholeImage);
initial_p = [1 0 start(1) ; 0 1 start(2)];

x = zeros(1,50);
y = zeros(1,50);

rectShape = vision.ShapeInserter('Shape','Rectangles','BorderColor',...
    'Custom','CustomBorderColor',[255 0 0]);
UV = zeros(2,100);
for i = 1:200
i
wholeImage = getsnapshot(vid);
wholeImage = imresize(wholeImage,videoDownScaleFactor);
wholeImage = im2double(wholeImage);
[current_p, test_section] = lucasKanade(wholeImage, template, initial_p);
if (current_p(1,3) > wholeX - size(template,2) || current_p(2,3) > wholeY - size(template,1) ...
        || current_p(1,3)<0 + size(template,2) || current_p(2,3) < 0 + size(template,1))
    disp('Fatal Error! returned point lies outside the image, aborting');
    current_p
    break;
end

UV(:,i) = [current_p(1,3);current_p(2,3)];
rect = int32([current_p(1,3)-(size(test_section,1)/2) ...
    current_p(2,3)-(size(test_section,2)/2) ...
    size(test_section,1) size(test_section,2)]);
J = step(rectShape , wholeImage , rect);
imshow(J)
initial_p = current_p;
template = test_section;
end
imshow(wholeImage);
hold on;
plot(UV(1,:),UV(2,:),'.','Color','g');
hold off;