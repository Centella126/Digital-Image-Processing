% GIRAR UNA IMAGEN
function[]=giroest()
clear all
close all

A=imread("C:\Users\fvp12\Downloads\UDG\7mo Semestre\Procesamiento Digital de Imágenes\Act8_totuga.jpg");
A=rgb2gray(A);
A=double(A);
n=size(A);

% Voltear la imagen
for i=1:n(1)
    for j=1:n(2)
        B(i,j)=A(n(1)+1-i,j);
    end
end

figure
pcolor(B); colormap(gray);shading flat; title ('Imagen original')

C=zeros(1600,1200);
beta=pi/8; %es ángulo del giro que se le aplicará

for i=1:n(1)
    for j=1:n(2)
        x1=(i-200); % 488/2 Posicionarse en el centro de la imagen
        y1=(j-200); % 732/2
        alfa = atan2(y1,x1);
        x2=cos(beta)*x1-sin(beta)*y1;
        y2=cos(beta)*y1+sin(beta)*x1;
        x2=round(x2); %necesitamos el entero para los pixeles
        y2=round(y2);
        C(800+x2,600+y2)=B(i,j);
    end
end

figure
pcolor(C); colormap(gray);shading flat; title ('Imagen original')

CF=fftshift(fft2(C));

figure
pcolor(C); colormap(gray);shading flat; title ('Imagen girada')
figure
surf(log(abs(CF)+1)); colormap("gray"); shading("flat"); title ('Transformada de Fourier en 3D')  

for i=1:1600
    for j=1:1200                    %% Es por el nuevo tamaño de la imagen
        x=(i-800)/800;
        y=(j-600)/600;
        H(i,j)=exp(-10*(x^2+y^2));
    end
end
size(H)
size(CF)
DF=CF.*H;
D=ifft2(fftshift(DF));
D=abs(D);

figure
surf(log(abs(DF)+1)); colormap("gray"); shading("flat"); title ('Campana de Gaus en 3D')
figure
pcolor(D); colormap(gray);shading flat; title ('Imagen filtrada')