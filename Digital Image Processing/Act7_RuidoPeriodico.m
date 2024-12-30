function[]=periodic()

A=imread("C:\Users\fvp12\Downloads\UDG\7mo Semestre\Procesamiento Digital de Imágenes\Act7_Resonancia.jpg");
%A=rgb2gray(A);
A=double(A);

n=size(A);

%Para voltear la imagen
for i=1:n(1)
    for j=1:n(2)
        B(i,j)=A(n(1)+1-i,j);
    end
end

BF=fftshift(fft2(B));

%Para elimininar los picos se necesita un filtro
n1=(n(1)+1)/2;
n2=(n(2)+1)/2;

%Función gaussiana
for i=1:n(1)
    for j=1:n(2)
        x=(i-n1)/n1;
        y=(j-n2)/n2;
        H(i,j)=1-exp(-800*((x-0.2)^2+y^2))-exp(-800*((x+0.2)^2+y^2));   %(x-0.2) es una prueba para ver si le atinamos al ruido periódico
                                                                        %Si en nuestra imagen tenemos puntos en diagonal el ruido es diagonal 
    end
end


figure
subplot(2,3,1); pcolor(B);colormap("gray");shading flat;
subplot(2,3,2); pcolor(log(abs(BF)+1));colormap("gray");shading flat;
subplot(2,3,3); surf(log(abs(BF)+1));colormap("gray");shading flat;
subplot(2,3,4); pcolor(H);colormap("gray");shading flat;
subplot(2,3,5); pcolor(log(abs(BF.*H)+1));colormap("gray");shading flat;
subplot(2,3,6); surf(log(abs(BF.*H)+1));colormap("gray");shading flat;

BFH=BF.*H;      
C=ifft2(ifftshift(BFH));  %transformada inversa 
C=abs(C);     %Solo con la parte real

figure
subplot(1,2,1); pcolor(C); colormap("gray"); shading("flat");
subplot(1,2,2); pcolor(B); colormap("gray"); shading("flat");
