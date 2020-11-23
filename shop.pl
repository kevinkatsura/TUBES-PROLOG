/************************ TRANSAKSI DI SHOP ************************/
:-dynamic(gold/1).
:-dynamic(count/2).

gold(1100). /*Jumlah uang awal*/
/*Inventory awal*/
count('Wooden Sword (Swordsman)',1).
count('Wooden Bow (Archer)',1).
count('Magic Book (Sorcerer)',1).
count('Health Potion',3).
count('Iron Armor',0).
count('Iron Helmet',0).
count('Iron Shield',0).
count('Excalibur (Swordsman)',0).
count('Fire Arrow (Archer)',0).
count('Magic Wand (Sorcerer)',0).

/*Menampilkan pilihan transaksi*/
shop:- 	write('What do you want to buy?'),nl,
		write('1. Gacha (1000 gold)'),nl,
		write('2. Health Potion (100 gold)'),nl.

/*Melakukan pembelian item yang telah dirandom apabila uang mencukupi*/
gacha:- gold(Y),Y<1000,
		write('You don\'t have enough money.'),nl,!.
gacha:-	gold(Y),Y>=1000,
		random(1,6,X),
		items(X),
		Z is (Y-1000), asserta(gold(Z)).

/*Melakukan pembelian potion apabila uang mencukupi*/
potion:-	gold(Y),Y<100,
			write('You don\'t have enough money.'),nl,!.
potion:-	write('You get Health Potion'),
			count('Health Potion',Y),Z is Y+1,asserta(count('Health Potion',Z)),
			gold(X),M is (X-100), asserta(gold(M)).

/*Menampilkan hasil gacha dan memperbaharui inventory*/
items(X):-	X=:=1, write('You get an Iron Armor.'),nl,
			count('Iron Armor',Y),Z is Y+1,asserta(count('Iron Armor',Z)).
items(X):-	X=:=2, write('You get an Iron Helmet.'),nl,
			count('Iron Helmet',Y),Z is Y+1,asserta(count('Iron Helmet',Z)).
items(X):-	X=:=3, write('You get an Iron Shield.'),nl,
			count('Iron Shield',Y),Z is Y+1,asserta(count('Iron Shield',Z)).
items(X):-	X=:=4, write('You get an Excalibur (Swordsman).'),nl,
			count('Excalibur (Swordsman)',Y),Z is Y+1,asserta(count('Excalibur (Swordsman)',Z)).
items(X):-	X=:=5, write('You get a Fire Arrow (Archer).'),nl,
			count('Fire Arrow (Archer)',Y),Z is Y+1,asserta(count('Fire Arrow (Archer)',Z)).
items(X):-	X=:=6, write('You get a Magic Wand.'),nl,
			count('Magic Wand (Sorcerer)',Y),Z is Y+1,asserta(count('Magic Wand (Sorcerer)',Z)).

/*Keluar dari shop*/
exitShop:- write('Thanks for coming.').

/*Menampilkan inventory ke layar*/
inventory:- nl,write('Your inventory:'),nl,
			invent('Wooden Sword (Swordsman)'),
			invent('Wooden Bow (Archer)'),
			invent('Magic Book (Sorcerer)'),
			invent('Health Potion'),
			invent('Iron Armor'),
			invent('Iron Helmet'),
			invent('Iron Shield'),
			invent('Excalibur (Swordsman)'),
			invent('Fire Arrow (Archer)'),
			invent('Magic Wand (Sorcerer)').

invent(X):-	count(X,Y),Y>0,write(Y),write(' '),write(X),nl.
invent(X):- count(X,Y),Y=0,write('').