clc;
clear all;
close all;

%!!!!Works only with Linux, have to add OSX and Windows Support
vid = videoinput('linuxvideo',1);
set(vid, 'ReturnedColorSpace','RGB');
preview(vid);
disp('Waiting for 8 Seconds for Camera to Gain Focus');
pause(8);
wholeImage = getsnapshot(vid);

[template,initial_p] = get_template(wholeImage);

current_p = lucasKanade(wholeImage, template, initial_p);