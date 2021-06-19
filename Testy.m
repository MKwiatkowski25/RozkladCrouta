function [Odp] = Testy(n,m,liczba,epsilon)
%Funkcja Testy() sprawdza czy zaimplementowana przez mnie metoda poprawnie
%rozwiązuje równania i zwraca wartość 1 (prawda) lub 0 (fałsz).
%Funkcja losuje macierz A (o wymiarach nxn) oraz dwie macierze B (o
%wymiarach nxm i mxn) i sprawdza czy błędy funkcji X_lewo(A,B) i
%X_prawo(A,B) są mniejsze niż epsilon. Parametr "liczba" odpowiada liczbie
%testów, które zostaną przeprowadzone.
if epsilon<0 %sprawdzam czy epsilon jest nieujemny
    error('Epsilon nie może być ujemny')
end
Odp=1; %ustawiam odpowiedź na 1
for i=1:liczba
    A=200*rand(n,n)-100; %losuję macierz A o wymiarach nxn i wartościach z (-100,100)
    BL=200*rand(m,n)-100; %losuję macierz BL o wymiarach mxn i wartościach z (-100,100)
    if max(max(abs(BL-X_lewo(A,BL)*A)))>epsilon
        Odp=0; %jeśli różnica między B a XA jest większa niż epsilon to zmieniam Odp na 0
    end
    BP=200*rand(n,m)-100; %losuję macierz BP o wymiarach nxm i wartościach z (-100,100)
    if max(max(abs(BP-A*X_prawo(A,BP))))>epsilon
        Odp=0; %jeśli różnica między B a XA jest większa niż epsilon to zmieniam Odp na 0
    end
end
end

