function [X] = X_prawo(A,B)
%funkcja rozwiązuje równanie AX=B przy pomocy rozkładu Crouta
if length(A(:,1))~=length(A(1,:)) %sprawdzam czy macierz A jest kwadratowa
    error('Macierz A nie jest kwadratowa')
end
if length(A)~=length(B(:,1)) %sprawdzam czy wymiary macierzy się zgadzają
    error('Wymiary macierzy się nie zgadzają')
end
for i=1:length(A)
    if max(abs(A(i,:)))==0 && max(abs(B(i,:)))>0
        error('Równanie nie ma rozwiązań')
        %równanie nie ma rozwiązań gdy wiersz A jest równy 0 a
        %odpowiadający mu wiersz B jest niezerowy
    end
end
[L,U]=Crout(A); %używam funkcji tworzącej rozkład Crouta
C=zeros(length(L),length(B(1,:))); %na początek rozwiążę równanie LC=B
for i=1:length(L) 
    if L(i,i)~=0 %unikam dzielenia przez 0
        C(i,:)=(B(i,:)-L(i,1:(i-1))*C(1:(i-1),:))/L(i,i); %obliczam i-ty wiersz macierzy C
    end
end
%powyżej obliczyłem C dlatego teraz zajmę się rozwiązaniem UX=C
X=zeros(length(L),length(B(1,:)));
for i=length(L):(-1):1 %będę obliczał macierz X idąc od ostatniego wiersza
    X(i,:)=C(i,:)-U(i,(i+1):length(L))*X((i+1):length(L),:); %obliczam i-ty wiersz X
end
end

