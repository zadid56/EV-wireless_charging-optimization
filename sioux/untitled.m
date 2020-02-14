close all
clc

a = load('DL.mat');
a = a.DL;
DL = zeros(2538,5);
cntr = 1;

for i=1:3:7612
    DL(cntr,:) = (a(i,:) + a(i+1,:) + a(i+2,:))/3;
    cntr = cntr+1;
end

