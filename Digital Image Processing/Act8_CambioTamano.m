function[]=periodic()

A=imread("C:\Users\fvp12\Downloads\UDG\7mo Semestre\Procesamiento Digital de Imágenes\Act8_totuga.jpg");
A=double(A);

n=size(A); %225 * 225

%Para voltear la imagen
for i=1:n(1)
    for j=1:n(2)
        B(i,j)=A(n(1)+1-i,j);
    end
end

figure
pcolor(B); colormap(gray);shading flat;

%% DOMINIO ESPACIAL %%
%% Reducir imagen - toma un dato cada 4 %%
m=n/4;
for i=1:m(1)
    for j=1:m(2)
        C(i,j)=B(i*4,j*4);
    end
end

%% Ampliar imagen - toma dos datos cada 1 %%
p=n*2;
for i=1:p(1)
    for j=1:p(2)
        D(i,j)=B(round(i/2),round(j/2));
    end
end

figure
subplot(1,2,1);pcolor(C); colormap(gray);shading flat;
subplot(1,2,2);pcolor(D); colormap(gray);shading flat;


%% DOMINIO FRECUENCIAL %%
BF=fftshift(fft2(B));

%% Ampliar %%
n1=[500,500];   
EF=zeros(n1);   %matriz de zeros con las medidas de n1

for i=1:n(1)
    for j=1:n(2)
        EF(i+135, j+133)=BF(i,j);
    end
end

E=ifft2(ifftshift(EF));
E=abs(E);

figure
subplot(2,2,1);pcolor(B); colormap(gray);shading flat;
subplot(2,2,2);pcolor(log(abs(BF)+1)); colormap(gray);shading flat; 
subplot(2,2,3);pcolor(log(abs(EF)+1)); colormap(gray);shading flat; 
subplot(2,2,4);pcolor(E); colormap(gray);shading flat;              


%% Reducir %%
n2=[150, 150];
GH=zeros(n2);

for i=1:n2(1)
    for j=1:n2(2)
        GH(i,j)=BF(i+40,j+40);
    end
end

G=ifft2(ifftshift(GH)); 
G=abs(G);

figure
subplot(2,2,1);pcolor(B); colormap(gray);shading flat;
subplot(2,2,2);pcolor(log(abs(BF)+1)); colormap(gray);shading flat; 
subplot(2,2,3);pcolor(log(abs(GH)+1)); colormap(gray);shading flat; 
subplot(2,2,4);pcolor(G); colormap(gray);shading flat; 


%% Reducir el tamaño en una direccion y ampliarlo en la otra

filaSize = round(n(1) * 2);
columnaSize = round(n(2) / 2);
F = zeros(filaSize, columnaSize);

for i = 1:filaSize
    for j = 1:columnaSize
        filaOrig = round(i / 2); 
        columnaOrig = j * 2; 

        % Verificar que los índices no excedan los límites de la imagen original
        if filaOrig < 1
            filaOrig = 1;
        elseif filaOrig > n(1)
            filaOrig = n(1);
        end
        
        if columnaOrig > n(2)
            columnaOrig = n(2);
        end

        F(i, j) = B(filaOrig, columnaOrig);
    end
end

figure
subplot(1,2,1);pcolor(B); colormap(gray);shading flat; title ('Imagen original')
subplot(1,2,2);pcolor(F); colormap(gray);shading flat; title ('Imagen reducida en X y aumentada en Y')

figure
pcolor(F); colormap(gray);shading flat; title ('Imagen reducida en X y aumentada en Y')
