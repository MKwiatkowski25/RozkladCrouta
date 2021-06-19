function [L,U] = Crout(A)
%funkcja przedstawia macierz kwadratową A w postaci LU, gdzie L jest macierzą dolną
%trójkątną, a U jest macierzą górną trójkątną, która ma jedynki na
%diagonali
if length(A(1,:))~=length(A(:,1)) %sprawdzam czy macierz A jest kwadratowa
    error('Macierz nie jest kwadratowa')
end
n=length(A);
if A(1,1)==0 && max(abs(A(1,2:n)))>0
    error('A nie ma rozkładu LU')
    %rozkład LU nie istnieje gdy w pierwszym wierszu pierwszy element jest
    %równy 0 a któryś z kolejnych niezerowy
end
L=zeros(size(A));
U=eye(size(A)); %do utworzenia macierzy U wykorzystam macierz jednostkową ponieważ U musi mieć jedynki na diagonali
for i=1:n %będę uzupełniać po kolei wiersze macierzy L i U
    for m=1:i
        L(i,m)=A(i,m)-L(i,1:(m-1))*U(1:(m-1),m); %obliczam kolejne wartości w i-tym wierszu pod diagonalą L
    end
    if L(i,i)~=0 %sprawdzam wartość L(i,i) by uniknąć dzielenia przez 0
        U(i,(i+1):n)=(A(i,(i+1):n)-L(i,1:(i-1))*U(1:(i-1),(i+1):n))/L(i,i);
        %obliczam wartości znajdujące się w i-tym wierszu nad diagonalą U
        %używając działań na wektorach
    end
end

