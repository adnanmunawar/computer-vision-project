clear all;
close all;
clc;

global first_run;
first_run = 1;

I = imread('white.jpg');
T = imread('ball2.jpg');

I = im2double(I);
T = im2double(T);

p = [0 0 258 ; 0 0 412];

[new_p , t] = lucasKanade(I,T,p);

new_p
figure;
imshow(I);
hold on;
plot(p(1,3),p(2,3),'.','Color','g');
plot(new_p(1,3),p(2,3),'.','Color','b');
hold off
figure;
imshow(T);

T1 = imcrop(I,[p(1,3)-(size(T,1)/2) p(2,3)-(size(T,2)/2) ...
    size(T,1)-1 size(T,1)-1]);

figure;
imshow(T1);

T2 = imcrop(I,[new_p(1,3)-(size(T,1)/2) new_p(2,3)-(size(T,2)/2) ...
    size(T,1)-1 size(T,1)-1]);
figure;
imshow(T2);