%Celem skryptu jest pokazanie działania funkcji Crout, X_prawo i X_lewo
%W pierwszej części pokażę kilka przykładowych rozkładów Crouta

%Przykład 1.1
disp('Przykład 1.1:')
A = [24 57 23; 12 38 79; 40 28 47] %macierz 3x3
[L,U]=Crout(A)
disp('Sprawdzenie:')
L*U

%Przykład 1.2
disp('Przykład 1.2:')
A=rand(13,13) %losowa macierz 13x13
[L,U]=Crout(A)
disp('Sprawdzenie:')
L*U

%Przykład 1.3
disp('Przykład 1.3:')
A = [3 0 0; 7 9 0; 2 0 5] %macierz trójkątna dolna
[L,U]=Crout(A)
disp('Sprawdzenie:')
L*U
%Macierz A jest trójkątna dolna więc możemy przyjąć L=A i wtedy U=I
%Dokładnie taki wynik zwróci nam algorytm na rozkład Crouta

%Przykład 1.4
disp('Przykład 1.4.1:')
A = [1 8 3; 0 1 9; 0 0 1] %macierz trójkątna górna
[L,U]=Crout(A)
disp('Sprawdzenie:')
L*U
%Macierz A jest trójkątna górna z jedynkami na diagonali więc pasuje
%podstawienie L=I, U=A. Taki wynik dostajemy przy pomocy algorytmu.
disp('Przykład 1.4.2:')
A = [65 79 20; 0 43 72; 0 0 2] %macierz trójkątna górna
[L,U]=Crout(A)
disp('Sprawdzenie:')
L*U
%Macierz A jest trójkątna górna jednak na jej diagonali nie ma jedynek,
%dlatego U~=A. Macierz L jest diagonalna.

%Teraz pokażę przykładowe błędy dla funkcji Crout

%Przykład 2.1
disp('Przykład 2.1.1:')
A = [2 5 6; 1 4 8] %macierz nie jest kwadratowa
Crout(A)
disp('Przykład 2.1.2:')
A = [2 6 8;1 5 2;6 2 6;4 9 10] %macierz nie jest kwadratowa
Crout(A)

%Przykład 2.2
disp('Przykład 2.2:')
A = [0 1;1 1] %macierz nie ma rozkładu Crouta
Crout(A)

%W tej części zaprezentuję funkcje X_lewo i X_prawo

%Przykład 3.1 - zastosowanie w rozwiązywaniu układu równań
A = [6 8 9 2 3; 13 3 46 2 7; 34 21 23 98 5; 4 16 45 3 12; 35 28 4 17 90]
B = [3 17 8 90 5]'
X_prawo(A,B)

%Przykład 3.2 - większe macierze
disp('Przykład 3.2.1:') %macierze wpisane
A=[25 14 2 56 3; 25 46 32 90 12; 57 9 13 34 5; 34 57 2 7 18; 100 29 8 3 19]
B = [34 2 90 7 8; 13 68 29 78 55; 89 4 24 8 1]
X=X_lewo(A,B)
X*A
disp('Przykład 3.2.2:') %macierze losowe
A = rand(13,13)
B = rand(13,13)
XP=X_prawo(A,B)
XL=X_lewo(A,B)
A*XP
XL*A

%Przykład 3.3 - B=I
disp('Przykład 3.3:')
A=[3 5 7 9 11; 12 7 20 9 15; 13 17 5 6 17; 1 2 6 4 3; 0 8 0 1 20]
B=eye(5)
XL=X_lewo(A,B)
XP=X_prawo(A,B)
%A*XP=I=XL*A dlatego XP=XL (są one macierzą odwrotną do A)

%Przykład 3.4 - zastosowanie funkcji Testy, przeprowadzającej testy losowe
disp('Przykład 3.4:')
Testy(13,10,20,0.0001) %oczywiście dane można modyfikować

%Przykład 3.5 - sprawdzenie błędu obliczeniowego funkcji
disp('Przykład 3.5.1:')
A=rand(10,10)
B=rand(10,5)
X_prawo(A,B)
Crout_Blad(A,B)
disp('Przykład 3.5.2:')
A=rand(12,12)
B=rand(3,12)
X_lewo(A,B)
Crout_Blad(A,B)

%W ostatniej części pokażę przykładowe błędy

%Przykład 4.1
disp('Przykład 4.1:')
A=rand(5,6) %macierz A nie jest kwadratowa
B=rand(5,5)
X_lewo(A,B)
X_prawo(A,B)

%Przykład 4.2
disp('Przykad 4.2:')
A=rand(10,10)
B=rand(8,9)
%złe dane wejściowe
X_lewo(A,B)
X_prawo(A,B)

%Przykład 4.3
disp('Przykład 4.3.1:')
A=[3 5 1;0 0 0; 6 9 2] %drugi wiersz zerowy
B=[2 5; 4 0; 7 9] %drugi wiersz niezerowy
X_prawo(A,B)
disp('Przykład 4.3.2:')
A=[5 3 0; 2 6 0; 19 8 0] %trzecia kolumna zerowa
B=[35 17 1; 1893 5719 0] %trzecia kolumna niezerowa
X_lewo(A,B)