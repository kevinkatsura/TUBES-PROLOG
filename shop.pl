/************************ TRANSAKSI DI SHOP ************************/
:-dynamic(count/2).
:-dynamic(isShop/0).

/*Inventory awal*/
count('Wooden Sword (Swordsman)',1).
count('Wooden Bow (Archer)',1).
count('Magic Book (Sorcerer)',1).
count('Health Potion',3).
count('Magic Vision',0).
count('Iron Armor',0).
count('Iron Helmet',0).
count('Iron Shield',0).
count('Excalibur (Swordsman)',0).
count('Fire Arrow (Archer)',0).
count('Magic Wand (Sorcerer)',0).

/*Menampilkan pilihan transaksi*/
shop:- 	isPlay,asserta(isShop),retract(isPlay),
		write('What do you want to buy?'),nl,
		write('1. Gacha (1000 gold)'),nl,
		write('2. Health Potion (100 gold)'),nl,
		write('3. Magic Vision (100 gold)'),nl.

/*Melakukan pembelian item yang telah dirandom apabila uang mencukupi*/
gacha:- isShop,
		gold(Y),Y<1000,
		write('You don\'t have enough money.'),nl,!.
gacha:-	isShop, 
		gold(Y),Y>=1000,beliGacha,!.

beliGacha:- amount(A), A=100,
			write('Your inventory is full, transaction canceled.'),nl,!.
beliGacha:-	amount(A), A<100, 
			random(1,7,X),
			items(X), gold(Y),
			Z is (Y-1000), asserta(gold(Z)),
			B is A+1,asserta(amount(B)),!.

/*Melakukan pembelian potion apabila uang mencukupi*/
potion:-	isShop,
			gold(Y),Y<100,
			write('You don\'t have enough money.'),nl,!.
potion:-	isShop,gold(Y),Y>=100,beliPotion,!.			

beliPotion:-	amount(A), A=100,
				write('Your inventory is full, transaction canceled.'),nl,!.
beliPotion:-	amount(A), A<100, 
				write('You get Health Potion.'),
				count('Health Potion',Y),Z is Y+1,asserta(count('Health Potion',Z)),
				gold(X),M is (X-100), asserta(gold(M)),
				B is A+1,asserta(amount(B)).

/*Melakukan pembelian Magic Vision apabila uang mencukupi*/
vision:-	isShop,
			gold(Y),Y<100,
			write('You don\'t have enough money.'),nl,!.
vision:-	isShop,gold(Y),Y>=100,beliVision,!.			

beliVision:-	amount(A), A=100,
				write('Your inventory is full, transaction canceled.'),nl,!.
beliVision:-	amount(A), A<100, 
				write('You get Magic Vision.'),
				count('Magic Vision',Y),Z is Y+1,asserta(count('Magic Vision',Z)),
				gold(X),M is (X-100), asserta(gold(M)),
				B is A+1,asserta(amount(B)).

/*Menampilkan hasil gacha dan memperbaharui inventory*/
items(X):-	X=:=1, write('You get an Iron Armor.'),nl,
			count('Iron Armor',Y),Z is Y+1,asserta(count('Iron Armor',Z)),upDefense(25),!.
items(X):-	X=:=2, write('You get an Iron Helmet.'),nl,
			count('Iron Helmet',Y),Z is Y+1,asserta(count('Iron Helmet',Z)),upDefense(10),!.
items(X):-	X=:=3, write('You get an Iron Shield.'),nl,
			count('Iron Shield',Y),Z is Y+1,asserta(count('Iron Shield',Z)),upDefense(15),!.
items(X):-	X=:=4,job('swordsman'),
			write('You get an Excalibur (Swordsman).'),nl,
			count('Excalibur (Swordsman)',Y),Z is Y+1,asserta(count('Excalibur (Swordsman)',Z)),
			upAttack(30),!.
items(X):-	X=:=4,job('archer'),
			write('You get an Excalibur (Swordsman).'),nl,
			count('Excalibur (Swordsman)',Y),Z is Y+1,asserta(count('Excalibur (Swordsman)',Z)),
			upAttack(25),!.
items(X):-	X=:=4,job('sorcerer'),
			write('You get an Excalibur (Swordsman).'),nl,
			count('Excalibur (Swordsman)',Y),Z is Y+1,asserta(count('Excalibur (Swordsman)',Z)),
			upAttack(15),!.
items(X):-	X=:=5,job('archer'),
			write('You get a Fire Arrow (Archer).'),nl,
			count('Fire Arrow (Archer)',Y),Z is Y+1,asserta(count('Fire Arrow (Archer)',Z)),
			upAttack(30),!.
items(X):-	X=:=5,job('swordsman'),
			write('You get a Fire Arrow (Archer).'),nl,
			count('Fire Arrow (Archer)',Y),Z is Y+1,asserta(count('Fire Arrow (Archer)',Z)),
			upAttack(15),!.
items(X):-	X=:=5,job('sorcerer'),
			write('You get a Fire Arrow (Archer).'),nl,
			count('Fire Arrow (Archer)',Y),Z is Y+1,asserta(count('Fire Arrow (Archer)',Z)),
			upAttack(25),!.
items(X):-	X=:=6,job('sorcerer'),
			write('You get a Magic Wand.'),nl,
			count('Magic Wand (Sorcerer)',Y),Z is Y+1,asserta(count('Magic Wand (Sorcerer)',Z)),
			upAttack(30),!.
items(X):-	X=:=6,job('swordsman'),
			write('You get a Magic Wand.'),nl,
			count('Magic Wand (Sorcerer)',Y),Z is Y+1,asserta(count('Magic Wand (Sorcerer)',Z)),
			upAttack(15),!.
items(X):-	X=:=6,job('archer'),
			write('You get a Magic Wand.'),nl,
			count('Magic Wand (Sorcerer)',Y),Z is Y+1,asserta(count('Magic Wand (Sorcerer)',Z)),
			upAttack(15),!.

/*Keluar dari shop*/
exitShop:-	isShop,!,retract(isShop),write('Thanks for coming.'), 
			asserta(isPlay).

/*Menampilkan inventory ke layar*/
inventory:- isShop,!,nl,write('Your inventory:'),nl,
			invent('Wooden Sword (Swordsman)'),
			invent('Wooden Bow (Archer)'),
			invent('Magic Book (Sorcerer)'),
			invent('Health Potion'),
			invent('Magic Vision'),
			invent('Iron Armor'),
			invent('Iron Helmet'),
			invent('Iron Shield'),
			invent('Excalibur (Swordsman)'),
			invent('Fire Arrow (Archer)'),
			invent('Magic Wand (Sorcerer)').
inventory:- isPlay,!,nl,write('Your inventory:'),nl,
			invent('Wooden Sword (Swordsman)'),
			invent('Wooden Bow (Archer)'),
			invent('Magic Book (Sorcerer)'),
			invent('Health Potion'),
			invent('Magic Vision'),
			invent('Iron Armor'),
			invent('Iron Helmet'),
			invent('Iron Shield'),
			invent('Excalibur (Swordsman)'),
			invent('Fire Arrow (Archer)'),
			invent('Magic Wand (Sorcerer)').

invent(X):-	count(X,Y),Y>0,write(Y),write(' '),write(X),nl,!.
invent(X):- count(X,Y),Y=0,write(''),!.