## Instrukcja użytkowania:

1. Uruchom ./Win32/Debug/Project1.exe
2. Wybierz arytmetykę z której chcesz korzystać
3. Wybierz z listy odpowiedni plik dll.
	- musi zgadzać się z wybraną arytmetyką inaczej program zwróci błąd
	- w przypadku używania własnej biblioteki umieść ją w powyższym katalogu
4. Wybierz metodę rozwiązania równiania
5. Wprowadź wartości przedziału
	- dla arytmetyki przedziałowej możliwe jest uzupełnienie tylko pierwszych pól dla a i b, wtedy program sam obliczy najmniejszy przedział
6. Kliknij 'Wylicz' i odczytaj rozwiązanie.

## Zawartość:

* Main.pas - główna funkcja, interakcja z użytkownikiem, wywoływanie funkcji liczących
* Funkcje arytmetyki zwykłej:
	- Polowienie.pas - metoda połowienia
	- Regula_falsi - metoda Regula Falsi
	- Sieczne - metoda Siecznych
* A także odpowiadające im funkcje arytmetyki przedziałowej
* IntervalArithemtic32and64 z dodanymi funkcjami i operatorami
* W Win32/Debug znajduje się skompilowany program Project1.exe oraz dołączone biblioteki dll:
	- functionStandard1.dll i functionInterval1.dll - f(x)=x*x-2
	- functionStandard2.dll i functionInterval2.dll - f(x)=
	- functionStandard3.dll i functionInterval3.dll - f(x)=

! W każdym pliku z funkcją arytmetyczną znajduje jej dokumentacja

## Interfejs:

![Alt text](EAN-View.png?raw=true "GUI")
