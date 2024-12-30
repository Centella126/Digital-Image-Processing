function[]=churrinche()
 
%Leer imagen
C=imread("C:\Users\fvp12\Downloads\UDG\7mo Semestre\Procesamiento Digital de Imágenes\act1_churrinche.jpg");

%Se muestra el tamaño de la matriz [alto ancho no.canales de color]
size(C);

figure(1)
imagesc(C); 
title('Original');

%Cada color sale en escala de grises
R=C(:,:,1); 
G=C(:,:,2);
B=C(:,:,3);

figure(2)
imshow(R, gray);    % muestra la imagen contenida en imread
title('Parte roja a blanco y negro');

figure(3)
imshow(G, gray);
title('Parte verde a blanco y negro');

figure(4)
imshow(B, gray);
title('Parte azul a blanco y negro');

%% Intercambio de colores %%

% Intercambio de rojo y verde
C1 = C; 
C1(:,:,1) = G; % Rojo por Verde
C1(:,:,2) = R; 
C1(:,:,3) = B;

figure(5)
imshow(C1);
title('Intercambio de rojo y verde');

% Intercambio de rojo y azul
C2 = C; 
C2(:,:,1) = B; % Rojo por Azul
C2(:,:,2) = G;
C2(:,:,3) = R; 

figure(6)
imshow(C2);
title('Intercambio de rojo y azul');

% Intercambio de verde y azul
C3 = C; 
C3(:,:,1) = R; 
C3(:,:,2) = B; % Verde por azul
C3(:,:,3) = G; 

figure(7)
imshow(C3);
title('Intercambio de verde y azul');

%Imagen a escala de grises
C4=rgb2gray(C);

figure(8)
imshow(C4);
title('Imagen en escala de grises');

%Negativo de la imagen
C5=255-C4; % Calcula el negativo de la imagen

figure(9)
imshow(C5);
title('Imagen negativa de la escala de grises');