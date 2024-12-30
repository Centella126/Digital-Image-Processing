function[]=inverso()
close all
clear all
clc

A=imread("C:\Users\fvp12\Downloads\UDG\7mo Semestre\Procesamiento Digital de Imágenes\Act8_ojo.jpeg");
A=rgb2gray(A);
A=double(A);
n=size(A);

for i=1:n(1)
    for j=1:n(2)
        B(i,j)=A(n(1)+1-i,j);
    end
end
BF=fftshift(fft2(B));
figure
subplot(1,2,1);pcolor(B); colormap("gray");shading flat;
subplot(1,2,2);pcolor(log(abs(BF)+1)); colormap("gray");shading flat;

u1=n(1)/2;
u2=n(2)/2;
k1=0.1;
for i=1:n(1)
    for j=1:n(2)
        u=(i-u1)/u1;
        v=(j-u2)/u2;
        H1(i,j)=exp(-k1*(u^2)+v^2)^(5/6);
    end
end
figure
pcolor(H1); colormap("gray");shading flat;

F=BF./H1;

f=ifft2(ifftshift(F));
f=abs(f);b

figure
subplot(2,3,1);pcolor(B); colormap("gray");shading flat;
subplot(2,3,2);pcolor(log(abs(BF)+1)); colormap("gray");shading flat;
subplot(2,3,3);pcolor(H1); colormap("gray");shading flat;
subplot(2,3,4);pcolor(log(abs(BF./H1)+1)); colormap("gray");shading flat;
subplot(2,3,5);pcolor(f); colormap("gray");shading flat;
subplot(2,3,1);pcolor(B); colormap("gray");shading flat;


