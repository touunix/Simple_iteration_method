%Mateusz Gabryel
%Metoda iteracji prostej - rozwi¹zywanie równañ nieliniowych
clc
clear
format longG;
format compact;
%-------------------------------------------------------------------------------------
%Równanie:
disp('Szukamy miejsca zerowego funkcji metod¹ iteracji prostej ')
disp('Mamy dane równanie: f(x)=x^3-3x-6');
disp('---------------------------------------------------------');
%Równanie funkcji:
f = @(x) x^3-3*x-6;
%-------------------------------------------------------------------------------------
%Lokalizacja przedzia³u [a,b] poprzez sporz¹dzenie tabelki:
tabelka = [0,0,0,0];
disp('Tabelka:');
for x=1:4
    tabelka(x) = f(x);
    disp(['f(',num2str(x),')= ',num2str(tabelka(x))]);
end
disp('---------------------------------------------------------');
%-------------------------------------------------------------------------------------
%Zlokalizowany przedzia³ [a,b]:
disp('Przedzia³ [a,b]:');
wartosc_referencyjna = 0;

d=sort(abs(wartosc_referencyjna-tabelka));   
najblizszy=find(abs(wartosc_referencyjna-tabelka)==d(1));
najblizszy_2 = najblizszy+1;
a = najblizszy;
b = najblizszy_2;

disp(['[',num2str(a),',',num2str(b),']']);
disp('---------------------------------------------------------');
%-------------------------------------------------------------------------------------
%Wyznaczenie œrodka przedzia³u [a,b]:
srodek_przedzialu=(a+b)/2;
disp(['Œrodek przedzia³u wynosi: ',num2str(srodek_przedzialu)]);
disp('---------------------------------------------------------');
%-------------------------------------------------------------------------------------
%Warunek dok³adnoœci:
epsilon = 1e-3;
%Przeksztalcenie postaci z f(x)=0 na x=F(x):
    F = @(x) (3*x+6)^(1/3);
%Wzór pochodnej F'(x):
    F_pochodna = @(x) (3*x+6)^(-2/3);
%-------------------------------------------------------------------------------------
if(f(a)*f(b) < 0)
    if (F_pochodna(srodek_przedzialu) < 1)
        disp('Warunek zbie¿noœci zosta³ spe³niony.');
        if (f(srodek_przedzialu) > epsilon)
            
            disp('Wyniki:');
            %x(0) = srodek przedzialu -> (a+b)/2
            numer_iteracji = 1;
            disp(['Iteracja numer: ',num2str(numer_iteracji)]);
            disp(['x(',num2str(numer_iteracji-1),')= ',num2str(srodek_przedzialu)]);            
%-------------------------------------------------------------------------------------
%Pêtla na iteracje:
            x(1) = F(srodek_przedzialu);    
            k=1;
            numer_iteracji = numer_iteracji + 1;

            while (f(x(k)) > epsilon)
                x(k+1)=F(x(k));
                disp(['Iteracja numer: ',num2str(numer_iteracji)]);
                disp(['x(',num2str(numer_iteracji-1),')= ',num2str(x(k))]);
                numer_iteracji = numer_iteracji + 1;
                k = k + 1;
            end 
        else
            disp('Wartoœæ mniejsza od epsilon, koniec liczenia.')
        end    
    else
        disp('Warunek zbie¿noœci nie zosta³ spe³niony.');
    end
else
    disp('Warunek f(a)*f(b)<0 nie spe³niony');
end
%-------------------------------------------------------------------------------------
%Wyœwietlenie zbiorczo wyników po iteracjach w wektorze x:
disp('---------------------------------------------------------');
disp('Zbiorcze wyniki po iteracjach:');
x = [srodek_przedzialu,x];
disp(x);
%-------------------------------------------------------------------------------------
%Koniec
%-------------------------------------------------------------------------------------