:- dynamic(gold/1).
:-dynamic(inv/1).

gold(1100). /*Jumlah uang awal*/
inv(['Wooden Sword (Swordsman)', 'Wooden Bow (Archer)', 'Magic Book (Sorcerer)', 'Health Potion', 'Health Potion', 'Health Potion']). /*Inventory awal*/

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
			inv(Y), push('Health Potion',Y,R),asserta(inv(R)),
			gold(X),Z is (X-100), asserta(gold(Z)).

items(X):-	X=:=1, write('You get an Iron Armor. '),nl,
			inv(Y), push('Iron Armor',Y,R),asserta(inv(R)).
items(X):-	X=:=2, write('You get an Iron Helmet.'),nl,
			inv(Y), push('Iron Helmet',Y,R),asserta(inv(R)).
items(X):-	X=:=3, write('You get an Iron Shield.'),nl,
			inv(Y), push('Iron Shield',Y,R),asserta(inv(R)).
items(X):-	X=:=4, write('You get an Excalibur.'),nl,
			inv(Y), push('Excalibur',Y,R),asserta(inv(R)).
items(X):-	X=:=5, write('You get a Fire Arrow.'),nl,
			inv(Y), push('Fire Arrow',Y,R),asserta(inv(R)).
items(X):-	X=:=6, write('You get a Magic Wand.'),nl,
			inv(Y), push('Magic Wand',Y,R),asserta(inv(R)).

exitShop:- write('Thanks for coming.').

/* MENAMPILKAN INVENTORY */
invent(X):- X=[_],front(X,F), write(F),nl,!.
invent(X):- front(X,F),write(F),nl, 
			pop(X,R), invent(R).

inventory:-	inv(X), invent(X).


/* DEKLARASI MANIPULASI LIST */
/* push(Element, Queue, Result) memasukkan element ke dalam queue, kemudian menghasilkan result.*/
push(E,[],R)			:-R=[E].				
push(E,[H|T],[H|Tnew])	:-push(E,T,Tnew).		

/* pop(Queue, Result) menghapus elemen terdepan dari queue, kemudian menghasilkan result*/
pop([_H|T],R)	:-R=T.

/* front(Queue, Result) mengembalikan elemen terdepan dari queue sebagai result*/
front([H|_T],R)	:-R=H.

/* back(Queue, Result) mengembalikan elemen terbelakang dari queue sebagai result*/
back([H],R)		:-R=H.		
back([_H|T],R)	:-back(T,X),R=X.	

