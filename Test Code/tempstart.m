clc;
clear all;
close all;

global first_run;
first_run = 1;
%!!!!Works only with Linux, have to add OSX and Windows Support
vid = VideoReader('moto.mov');

wholeImage = read(vid,1);
wholeImage = im2double(wholeImage);
wholeX = size(wholeImage,2);
wholeY = size(wholeImage,1);

[template,start] = get_template_manually(wholeImage);
initial_p = [1 0 start(1) ; 0 1 start(2)];

nframes = vid.NumberOfFrames;
x = zeros(1,50);
y = zeros(1,50);
figure(3);
%figure(4);
for i = 1:50
i
wholeImage = read(vid,i);
wholeImage = im2double(wholeImage);
[current_p, test_section] = lucasKanade(wholeImage, template, initial_p);
if (current_p(1,3) > wholeX - size(template,2) || current_p(2,3) > wholeY - size(template,1) ...
        || current_p(1,3)<0 + size(template,2) || current_p(2,3) < 0 + size(template,1))
    disp('Fatal Error! returned point lies outside the image, aborting');
    current_p
    break;
end
figure(3);
imshow(wholeImage);
hold on;
x(i) = current_p(1,3);
y(i) = current_p(2,3);
plot(x(1:i),y(1:i),'.');
hold off;
%figure(4);
%imshow(test_section);
initial_p = current_p;
template = test_section;
end