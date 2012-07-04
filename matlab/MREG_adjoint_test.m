% MREG Test

clear all; close all; clc;
load ../daten/MREG_data_Graz;

% test for adjoint property: looks good
x1 = randn(size(z));
y2 = randn(size(data));


osf = 1.25;%1,1.25,1.5,1.75,2
wg = 3;%3-7
sw = 8;
imwidth = 64;
k = E.nufftStruct.om'./(2*pi);
w = ones(E.trajectory_length,1);

G3D = GRIDDING3D(k,w,imwidth,osf,wg,sw);


y1 = G3D * x1;
x2 = G3D' * y2;

printf('Adjoint test result: %e\n', x1(:)'*x2(:) - y1(:)'*y2(:));

% Apply to data
%data1 = E * z;
%z1 = E' * data1;
