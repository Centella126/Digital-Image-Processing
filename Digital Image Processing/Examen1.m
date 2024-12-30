clc
clear all
close all

A=imread("C:\Users\fvp12\Downloads\UDG\7mo Semestre\Procesamiento Digital de Imágenes\examen.png");
A=rgb2gray(A);

n=size(A);
n1=n(1)/2;
n2=n(2)/2;

for i=1:n1
    for j=1:n2
        B(i,j)=A(2*i, 2*j);
    end
end

figure
imshow(A)
figure
imshow(B)