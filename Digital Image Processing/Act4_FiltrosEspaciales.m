%% Filtros Espaciales %%
function[]=filtpb()

close all 

%A=imread("C:\Users\fvp12\Downloads\UDG\7mo Semestre\Procesamiento Digital de Imágenes\Act4_Modelo.jpg");
A=imread("C:\Users\fvp12\Downloads\UDG\7mo Semestre\Procesamiento Digital de Imágenes\examen.png");
A=rgb2gray(A);
A=double(A);
histogram(A);

figure
imshow(A,gray)

ruido = rand(size(A));
%ruido=rand(1280,1280);

A=A+(50*ruido);
n=size(A);

figure
imshow(A,gray);

B=A;
for i=2:n(1)-1
    for j=2:n(2)-1
        B(i,j)=(A(i-1, j-1)+A(i-1,j)+A(i-1, j+1)+A(i,j-1)+A(i,j+1)+A(i,j)+A(i+1, j-1)+A(i+1,j)+A(i+1,j+1))/9;  %corresponde a un filtro pasabajas de una matriz de 3x3
    end
end

figure
imshow(B,gray)
histogram(B)

C=A;
for i=3:n(1)-1
    for j=3:n(2)-2
        C(i,j)=(A(i-2,j-2)+A(i-1,j-2)+A(i,j-2)+A(i+1,j-2)+A(i+2,j-2)+A(i-2,j-1)+A(i-1, j-1)+A(i,j-1)+A(i+1,j-1)+A(i+2,j-1)+A(i-2,j)+A(i-1,j)+A(i,j)+A(i+1,j)+A(i+2,j)+A(i-2,j+2)+A(i-1,j+2)+A(i,j+2)+A(i+1,j+2)+A(i+2,j+2)+A(i-2,j+1)+A(i-1,j+1)+A(i,j+1)+A(i+1,j+1)+A(i+2,j+1))/25;
    end
end
figure
imshow(C, gray)

w=7;
w1=(w+1)/2;

W=zeros(w,w);

for i=w1:n(1)-w1-1
    for j=w1:n(2)-w1-1
        for k=1:w
            for l=1:w
                W(k,l)=A(i-w1+k,j-w1+l);
            end
        end
        D(i,j)=sum(sum(W))/w^2;
    end
end
figure
imshow(D, gray)


    