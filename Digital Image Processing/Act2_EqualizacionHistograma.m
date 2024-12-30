function[] = equali()

C=imread("C:\Users\fvp12\Downloads\UDG\7mo Semestre\Procesamiento Digital de Imágenes\act2_Pajaro.png");

n=size(C);

C1=rgb2gray(C); %La imagen se pasa a escalas de grises
C1=double(C1);  %Convierte el tipo de dato de entero a flotante

n=size(C1);

figure
imshow(C1, gray);

max(max(C1))    %Entrega el maximo valor, el que está más claro
min(min(C1))    %Nos dice su nivel de gris menor es 0, es negro
                % Como no da 0 y 255, significa que no está aprovechando
                % toda la escala de grises

H=zeros(1,256);
for i=1:n(1)
    for j=1:n(2)
        H(round(C1(i,j)+1)) = H(round(C1(i,j))+1)+1;
    end
end

k=1:256
figure
plot(k,H,'r');

figure
histogram(C1);

C2=255*(C1-min(min(C1)))/(max(max(C1)) - min(min(C1)));

figure
subplot(2,2,1); imshow(C1, gray);
subplot(2,2,2); histogram(C1);
subplot(2,2,3); imshow(C2, gray);
subplot(2,2,4); histogram(C2);

