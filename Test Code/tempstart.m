clc;
clear all;
close all;

%!!!!Works only with Linux, have to add OSX and Windows Support
vid = VideoReader('moto.mov');

wholeImage = read(vid,1);
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
[current_p, test_section] = lucasKanade(wholeImage, template, initial_p);
if (current_p(1,3) > wholeX || current_p(2,3) > wholeY)
    disp('Fatal Error! returned point lies outside the image, aborting');
    current_p;
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