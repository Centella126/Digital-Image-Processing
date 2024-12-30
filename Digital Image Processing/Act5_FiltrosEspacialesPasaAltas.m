%% Filtros Espaciales %%
%una de las funciones de los filtros pasaaltos es el de detectar bordes 

function[]=filtpa()

A=imread("C:\Users\fvp12\Downloads\UDG\7mo Semestre\Procesamiento Digital de Imágenes\Act4_Modelo.jpg");
A=rgb2gray(A);
A=double(A);

n=size(A);
ruido=rand(n);

figure
imshow(A,gray)

A=A+0*ruido;
n=size(A);
figure
imshow(A,gray)
B=A;
for i=2:n(1)-1
    for j=2:n(2)-1
        B(i,j)=(A(i-1,j-1)+A(i-1,j)+A(i-1,j+1)+A(i,j-1)+A(i,j)+A(i,j+1)+A(i+1,j-1)+A(i+1,j)+A(i+1,j+1))/9;
    end
end
% figure
% imshow(B,gray)
C=A;
for i=3:n(1)-2
    for j=3:n(2)-2
        C(i,j)=(A(i-2,j-2)+A(i-2,j-1)+A(i-2,j)+A(i-2,j+1)+A(i-2,j+2)+A(i-1,j-2)+A(i-1,j-1)+A(i-1,j)+A(i-1,j+1)+A(i-1,j+2)+A(i,j-2)+A(i,j-1)+A(i,j)+A(i,j+1)+A(i,j+2)+A(i+1,j-2)+A(i+1,j-1)+A(i+1,j)+A(i+1,j+1)+A(i+1,j+2)+A(i+2,j-2)+A(i+2,j-1)+A(i+2,j)+A(i+2,j+1)+A(i+2,j+2))/25;
    end
end
% figure
% imshow(C,gray)
w=3;
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
% figure
% imshow(D,gray)

for i=1:n(1)
    for j=1:n(2)
        if i>1
            Ex(i,j)=A(i,j)-A(i-1,j);
        else
            Ex(i,j)=0;
        end
        if j>1
            Ey(i,j)=A(i,j)-A(i,j-1);
        else
            Ey(i,j)=0;
        end
       
        if (i>1)&(i<n(1))&(j>1)&(j<n(2))
            L(i,j)=-4*A(i,j)+A(i+1,j)+A(i-1,j)+A(i,j+1)+A(i,j-1);
        else
            L(i,j)=0;
        end
    end
end
Ex=abs(Ex);
Ey=abs(Ey);
La=abs(L);

G=A-0.1*L;

figure
imshow(Ex,[min(min(Ex)) max(max(Ex))]) %esto es la derivada en x
figure
imshow(Ey,[min(min(Ey)) max(max(Ey))])
figure
imshow(La,[min(min(La)) max(max(La))])

figure
imshow(G,[min(min(G)) max(max(G))])

%Este filtro se conoce como filtro de Sobel
       

    