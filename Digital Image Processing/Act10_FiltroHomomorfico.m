function[]=homomo()
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

figure
pcolor(B); colormap("gray");shading flat;

C=log(B+1);

figure
pcolor(C); colormap("gray");shading flat;

CF=fftshift(fft2(C));

figure
pcolor(log(abs(CF+1))); colormap("gray");shading flat;

n1=round(n(1)/2);
n2=round(n(2)/2);

for i=1:n(1)
    for j=1:n(2)
        u=(i-n1)/n1;
        v=(j-n2)/n2;
        H(i,j)=(1-0.5*exp(-50*(u^2+v^2)));
    end
end

h=H(:,n2);
k=1:n(1);

figure
subplot(1,2,1); plot(k,h,'r')
subplot(1,2,2); pcolor(H); colormap("gray");shading flat;

CFH=CF.*H;
Ch=ifft2(ifftshift(CFH));
Ch=abs(Ch);

figure
pcolor(Ch); colormap("gray");shading flat;

D=exp(Ch);

figure
pcolor(D); colormap("gray");shading flat;

