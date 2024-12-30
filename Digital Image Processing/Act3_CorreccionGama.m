function [] = gama5()

A=imread("C:\Users\fvp12\Downloads\UDG\7mo Semestre\Procesamiento Digital de Imágenes\Act3_Viejo.jpg");

B = rgb2gray(A);
size(B);

figure
histogram(A);

B=rgb2gray(A);
B=double(B);

%correción gama, exponente mayor a uno es para oscurecer, menor a uno lo
%hace más claro

C=B.^1.2;
D=B.^0.8;
E=B.^0.6;
F=B.^0.4;
G=B.^0.2;

figure
subplot(2,3,1);imshow(C,[min(min(C)), max(max(C))]);
subplot(2,3,2);imshow(B,[min(min(B)), max(max(B))]);
subplot(2,3,3);imshow(D,[min(min(D)), max(max(D))]);
subplot(2,3,4);imshow(E,[min(min(E)), max(max(E))]);
subplot(2,3,5);imshow(F,[min(min(F)), max(max(F))]);
subplot(2,3,6);imshow(G,[min(min(G)), max(max(G))]);
