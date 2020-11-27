/************************ TRANSAKSI DI SHOP ************************/
:-dynamic(count/2).
:-dynamic(isShop/0).

/*Inventory awal*/
count('Wooden Sword (Swordsman)',1).
count('Wooden Bow (Archer)',1).
count('Magic Book (Sorcerer)',1).
count('Health Potion',3).
count('Magic Vision',0).
count('Holy Potion',0).
count('Iron Armor',0).
count('Iron Helmet',0).
count('Iron Shield',0).
count('Excalibur (Swordsman)',0).
count('Fire Arrow (Archer)',0).
count('Magic Wand (Sorcerer)',0).

/*Menampilkan pilihan transaksi*/
shop:- 	isPlay,!,playerPosition([X,Y]),isStorePosition(X,Y),
		!,asserta(isShop),retract(isPlay),nl,
		write('What do you want to buy?'),nl,
		write('1. Gacha (1000 gold)'),nl,
		write('2. Health Potion (100 gold)'),nl,
		write('3. Magic Vision (100 gold)'),nl,
		write('4. Holy Potion(1000 gold)'),nl,!.

/*Melakukan pembelian item yang telah dirandom apabila uang mencukupi*/
gacha:- isShop,gold(X),!,cekGacha(X).

cekGacha(X):- X<1000, nl,write('You don\'t have enough money.'),nl,!.
cekGacha(X):- X>=1000, beliGacha,!.

beliGacha:- amount(A), A=100,nl,
			write('Your inventory is full, transaction canceled.'),nl,!.
beliGacha:-	amount(A), A<100, 
			random(1,7,X),
			items(X), gold(Y),
			Z is (Y-1000), asserta(gold(Z)),
			B is A+1,asserta(amount(B)),!.

/*Melakukan pembelian potion apabila uang mencukupi dan kapasitas inventory memadai*/
potion:-	isShop,gold(X),!,cekGacha(X).	

cekPotion(X):- X<100,nl,write('You don\'t have enough money.'),nl,!.
cekPotion(X):- X>=100,beliPotion,!.

beliPotion:-	amount(A), A=100,nl,
				write('Your inventory is full, transaction canceled.'),nl,!.
beliPotion:-	amount(A), A<100, nl,
				write('You get Health Potion.'),
				count('Health Potion',Y),Z is Y+1,asserta(count('Health Potion',Z)),
				gold(X),M is (X-100), asserta(gold(M)),
				B is A+1,asserta(amount(B)).

/*Melakukan pembelian Magic Vision apabila uang mencukupi dan kapasitas inventory memadai*/
vision:-	isShop,gold(X),!,cekVision(X).	

cekVision(X):- X<100,nl,write('You don\'t have enough money.'),nl,!.
cekVision(X):- X>=100,beliVision,!.

beliVision:-	amount(A), A=100,nl,
				write('Your inventory is full, transaction canceled.'),nl,!.
beliVision:-	amount(A), A<100, nl,
				write('You get Magic Vision.'),nl,
				count('Magic Vision',Y),Z is Y+1,asserta(count('Magic Vision',Z)),
				gold(X),M is (X-100), asserta(gold(M)),
				B is A+1,asserta(amount(B)).

holyPotion:- isShop,gold(X),!,cekHPotion(X).

cekHPotion(X):- X<1000, nl,write('You don\'t have enough money.'),nl,!.
cekHPotion(X):- X>=1000, beliHPotion,!.

beliHPotion:-	amount(A), A=100,nl,
				write('Your inventory is full, transaction canceled.'),nl,!.
beliHPotion:-	amount(A), A<100, nl,
				write('You get Holy Potion.'),nl,
				count('Holy Potion',Y),Z is Y+1,asserta(count('Holy Potion',Z)),
				gold(X),M is (X-100), asserta(gold(M)),
				B is A+1,asserta(amount(B)).

/*Menampilkan hasil gacha dan memperbaharui inventory*/
items(X):-	X=:=1, nl,write('You get an Iron Armor.'),nl,
			count('Iron Armor',Y),Z is Y+1,asserta(count('Iron Armor',Z)),upDefInv(25),!.
items(X):-	X=:=2,nl, write('You get an Iron Helmet.'),nl,
			count('Iron Helmet',Y),Z is Y+1,asserta(count('Iron Helmet',Z)),upDefInv(10),!.
items(X):-	X=:=3, write('You get an Iron Shield.'),nl,
			count('Iron Shield',Y),Z is Y+1,asserta(count('Iron Shield',Z)),upDefInv(15),!.
items(X):-	X=:=4,job('swordsman'),nl,
			write('You get an Excalibur (Swordsman).'),nl,
			count('Excalibur (Swordsman)',Y),Z is Y+1,asserta(count('Excalibur (Swordsman)',Z)),
			upAttInv(30),!.
items(X):-	X=:=4,job('archer'),nl,
			write('You get an Excalibur (Swordsman).'),nl,
			count('Excalibur (Swordsman)',Y),Z is Y+1,asserta(count('Excalibur (Swordsman)',Z)),
			upAttInv(25),!.
items(X):-	X=:=4,job('sorcerer'),nl,
			write('You get an Excalibur (Swordsman).'),nl,
			count('Excalibur (Swordsman)',Y),Z is Y+1,asserta(count('Excalibur (Swordsman)',Z)),
			upAttInv(15),!.
items(X):-	X=:=5,job('archer'),nl,
			write('You get a Fire Arrow (Archer).'),nl,
			count('Fire Arrow (Archer)',Y),Z is Y+1,asserta(count('Fire Arrow (Archer)',Z)),
			upAttInv(30),!.
items(X):-	X=:=5,job('swordsman'),nl,
			write('You get a Fire Arrow (Archer).'),nl,
			count('Fire Arrow (Archer)',Y),Z is Y+1,asserta(count('Fire Arrow (Archer)',Z)),
			upAttInv(15),!.
items(X):-	X=:=5,job('sorcerer'),nl,
			write('You get a Fire Arrow (Archer).'),nl,
			count('Fire Arrow (Archer)',Y),Z is Y+1,asserta(count('Fire Arrow (Archer)',Z)),
			upAttInv(25),!.
items(X):-	X=:=6,job('sorcerer'),nl,
			write('You get a Magic Wand.'),nl,
			count('Magic Wand (Sorcerer)',Y),Z is Y+1,asserta(count('Magic Wand (Sorcerer)',Z)),
			upAttInv(30),!.
items(X):-	X=:=6,job('swordsman'),nl,
			write('You get a Magic Wand.'),nl,
			count('Magic Wand (Sorcerer)',Y),Z is Y+1,asserta(count('Magic Wand (Sorcerer)',Z)),
			upAttInv(15),!.
items(X):-	X=:=6,job('archer'),nl,
			write('You get a Magic Wand.'),nl,
			count('Magic Wand (Sorcerer)',Y),Z is Y+1,asserta(count('Magic Wand (Sorcerer)',Z)),
			upAttInv(15),!.

/*Keluar dari shop*/
exitShop:-	isShop,!,retract(isShop),nl,write('Thanks for coming.'),nl, 
			asserta(isPlay),w.

/*Menampilkan inventory ke layar*/
inventory:- isShop,!,nl,writeInvent,!.
inventory:- isPlay,!,nl,writeInvent,!.

writeInvent:-	nl,write('Your inventory:'),nl,
				invent('Wooden Sword (Swordsman)'),
				invent('Wooden Bow (Archer)'),
				invent('Magic Book (Sorcerer)'),
				invent('Health Potion'),
				invent('Holy Potion'),
				invent('Magic Vision'),
				invent('Iron Armor'),
				invent('Iron Helmet'),
				invent('Iron Shield'),
				invent('Excalibur (Swordsman)'),
				invent('Fire Arrow (Archer)'),
				invent('Magic Wand (Sorcerer)').

invent(X):-	count(X,Y),!,adaInvent(X,Y).

adaInvent(X,Y):- Y>0,write(Y),write(' '),write(X),nl,!.
adaInvent(_X,Y):- Y=0,write(''),!.

/*menggunakan Health Potion jika pemain memiliki Health Potion*/
usePotion:- isPlay,!,count('Health Potion',X),adaPotion(X),!.
usePotion:- isBattle,!,count('Health Potion',X),adaPotion(X),!.
usePotion:- isShop,!,count('Health Potion',X),adaPotion(X),!.

adaPotion(X):- X>0,nl,write('You heal 300 HP.'),upHealth(300),nl,!.
adaPotion(X):- X=0,nl,write('You don\'t have any Health Potion.'),nl,!.

/*menggunakan Holy Potion jika pemain memiliki Holy Potion*/
useHolyPotion:- isPlay,!,count('Holy Potion',X),adaHPotion(X),!.
useHolyPotion:- isBattle,!,count('Holy Potion',X),adaHPotion(X),!.
useHolyPotion:- isShop,!,count('Holy Potion',X),adaHPotion(X),!.

adaHPotion(X):- X>0,nl,write('Your HP is full again.'),batasHP(Y),asserta(health(Y)),nl,!.
adaHPotion(X):- X=0,nl,write('You don\'t have any Holy Potion.'),nl,!.

