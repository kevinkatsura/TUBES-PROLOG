:- dynamic(gold/1).
gold(5000). /*Jumlah uang awal*/

/*Menampilkan pilihan transaksi*/
shop:- 	write('What do you want to buy?'),nl,
		write('1. Gacha (1000 gold)'),nl,
		write('2. Health Potion (100 gold)'),nl.

/*Melakukan pembelian item yang telah dirandom apabila uang mencukupi*/
gacha:- gold(Y), Y<1000,!,
		write('You don\'t have enough money.'),nl.
gacha:-	gold(Y), Y>=1000,
		random(1,6,X),
		items(X),
		Z is (Y-1000), asserta(gold(Z)).

/*Melakukan pembelian potion apabila uang mencukupi*/
potion:-	gold(Y), Y<100,!, 
			write('You don\'t have enough money.'),nl.

potion:-	write('You get Health Potion'),
			gold(X), Y is (X-100), asserta(gold(Y)).

items(X):- X=:=1, write('You get an Iron Armor. '),nl.
items(X):- X=:=2, write('You get an Iron Helmet.'),nl.
items(X):- X=:=3, write('You get an Iron Shield.'),nl.
items(X):- X=:=4, write('You get an Excalibur.'),nl.
items(X):- X=:=5, write('You get a Fire Arrow.'),nl.
items(X):- X=:=6, write('You get a Magic Wand.'),nl.

exitShop:- write('Thanks for coming.').

