function [] = Crout_Blad(A,B)
%Funkcja sprawadza czy można rozwiązać równania AX=B lub XA=B i wypisuje
%błąd zaimplementowanej przeze mnie metody rozwiązywania tych równań.
if length(A(:,1))~=length(A(1,:)) %sprawdzam czy macierz A jest kwadratowa
    error('Macierz nie jest kwadratowa')
end
if length(A(:,1))==length(B(:,1))
    disp('Błąd obliczania A*X:')
    max(max(abs(B-A*X_prawo(A,B)))) %maksymalna różnica między B a AX
end
if length(A(1,:))==length(B(1,:))
    disp('Błąd obliczania X*A')
    max(max(abs(B-X_lewo(A,B)*A))) %maksymalna różnica między B a XA
end
end

