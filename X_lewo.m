function [X] = X_lewo(A,B)
%funkcja rozwiązuje równanie XA=B przy pomocy rozkładu Crouta
if length(A(:,1))~=length(A(1,:)) %sprawdzam czy macierz A jest kwadratowa
    error('Macierz A nie jest kwadratowa')
end
if length(A(1,:))~=length(B(1,:)) %sprawdzam czy wymiary macierzy się zgadzają
    error('Wymiary macierzy się nie zgadzają')
end
for i=1:length(A)
    if max(abs(A(:,i)))==0 && max(abs(B(:,i)))>0
        error('Równanie nie ma rozwiązań')
        %równanie nie ma rozwiązań gdy kolumna A jest równa 0 a
        %odpowiadająca jej kolumna B jest niezerowa
    end
end
[L,U]=Crout(A); %używam funkcji tworzącej rozkład Crouta
C=zeros(size(B)); %na początek rozwiążę równanie CU=B
for i=1:length(A)
    C(:,i)=B(:,i)-C(:,1:(i-1))*U(1:(i-1),i); %obliczam i-ty wiersz macierzy C
end
%powyżej obliczyłem C dlatego teraz zajmę się rozwiązaniem XL=C
X=zeros(size(B));
for i=length(A):(-1):1 %będę obliczał macierz X idąc od ostatniego wiersza
    if L(i,i)~=0 %unikam dzielenia przez 0
        X(:,i)=(C(:,i)-X(:,(i+1):length(A))*L((i+1):length(A),i))/L(i,i); %obliczam i-ty wiersz X
    end
end
end

