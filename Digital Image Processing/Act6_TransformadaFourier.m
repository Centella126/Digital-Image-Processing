function[]=fftpdi()

A=imread("C:\Users\fvp12\Downloads\UDG\7mo Semestre\Procesamiento Digital de Imágenes\Act6_Pango.jpg");
A=rgb2gray(A);
A=double(A);
n=size(A);

% figure
% imshow(A,gray)
% 
% AF=fftshift(fft2(A));  %el 2 de fft2 significa que es de dos dimensiones
% 
% figure
% subplot(1,2,1); 
% imshow(real(AF), [min(min(real(AF))) max(max(real(AF)))])
% subplot(1,2,2); 
% imshow(imag(AF), [min(min(imag(AF))) max(max(imag(AF)))])
% 
% figure
% imshow(abs(AF), [min(min(abs(AF))) max(max(abs(AF)))])
% 
% figure
% surf(abs(AF));
% colormap("gray");
% shading flat;
% 
% 
% figure
% imshow(log(abs(AF)+1), [min(min(log(abs(AF)+1))) max(max(log(abs(AF)+1)))])   %log(abs(AF)+1) es como vamos a mostrar la transformada de fourier
%                                                                               %de la otra forma, no se aprecia información
% figure
% surf(log(abs(AF)+1)); colormap("gray"); shading flat;
% 
% figure
% pcolor(log(abs(AF)+1)); colormap("gray"); shading("flat"); %pcolor es como surf pero a 90 grados
% 
% figure
% pcolor(A); colormap("gray"); shading("flat");  %Podemos ver la imagen de cabeza, es lo que hace el mal pcolor

%Para evitar que pcolor invierta las imagénes, invertimos la imagen desde el inicio

ruido=rand(n);

for i=1:n(1)
    for j=1:n(2)
        B(i,j)=A(n(1)+1-i,j);
    end
end

C=B+100*ruido;  %Imagen con ruido

BF=fftshift(fft2(B));

figure
pcolor(log(abs(BF))); colormap("gray"); shading("flat");

figure
pcolor(B); colormap("gray"); shading("flat");

n1=n(1)/2;
n2=n/2;

%Creación de la función gausiana 
for i=1:n(1)
    for j=1:n(2)
        x=(i-n1)/n1;
        y=(j-n2)/n2;
        H(i,j)=exp(-20*(x^2+y^2));  %el -20 se puede cambiar para hacer más angosto o más ancho el filtro y así difuminar en mayor o menor medida    
    end
end

figure
pcolor(H); colormap("gray"); shading("flat");

BFH=BF.*H;      %Función gausiana por la transformada
figure
pcolor(log(abs(BFH)+1)); colormap("gray"); shading("flat");

Bh=ifft2(ifftshift(BFH));  %transformada inversa 
Bh=abs(Bh);     %Solo con la parte real

figure
pcolor(Bh); colormap("gray"); shading("flat");


%graficar normal, imagen con ruido e imagen filtrada

figure
subplot (1,3,1); pcolor(B), colormap("gray"); shading("flat");
subplot (1,3,2); pcolor(C), colormap("gray"); shading("flat");
subplot (1,3,3); pcolor(Bh), colormap("gray"); shading("flat");
