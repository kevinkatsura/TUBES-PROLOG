:- dynamic(panjangMap/1).
:- dynamic(lebarMap/1).
:- dynamic(gym/1).            %gym([X,Y])
:- dynamic(player/1).         %player([X,Y])
:- dynamic(musuh/2).    %musuh(nama,[X,Y])
:- dynamic(battle/1).
:- dynamic(banyakMusuh/1).

enemy(1,slime).
enemy(2,goblin).
enemy(3,wolf).
enemy(4,dungeon).


makeMap :-	random(15,20,Panjang),
           	random(10,15,Lebar),
           	asserta(panjangMap(Panjang)),
           	asserta(lebarMap(Lebar)).
posisiPlayer	:- 	panjangMap(Panjang),
					lebarMap(Lebar),
					random(1,Panjang,BarisPlayer),
					random(1,Lebar,KolomPlayer),
					asserta(player([BarisPlayer,KolomPlayer])).

printMap	:-	panjangMap(Panjang),Panjang=:=1,
isTopBorder(_,Y)	:- 	Y=:=0,!.
isBottomBorder(_,Y)	:- 	panjangMap(Panjang),
						Y=:=Panjang+1,!.
isRightBorder(X,_)	:-	lebarMap(Lebar),
						X=:Lebar+1,!.
isLeftBorder(X,_)	:-	lebarMap(Lebar),
						X=:=0,!.

makeMusuh2	:-	panjangMap(Panjang),
				lebarMap(Lebar),
				random(1,Panjang,X),
				random(1,Lebar,Y),
				random(1,3,Number),
				musuh(_,[A,B]),
				A =\= X,
				B =\= Y,
				enemy(Number,NamaMusuh),
				asserta(musuh(NamaMusuh,[X,Y])).

makeMusuh1	:-	panjangMap(Panjang),
				lebarMap(Lebar),
				random(1,Panjang,X),
				random(1,Lebar,Y),
				random(1,3,Number),
				musuh(_,[A,B]),
				enemy(Number,NamaMusuh),
				asserta(musuh(NamaMusuh,[X,Y])).

makeMusuhAwal	:-	panjangMap(Panjang),
					lebarMap(Lebar),
					X1 is Panjang*Lebar,
					X2 is X1/2.
					random(1,X2,Number),
					asserta(banyakMusuh(Number)).
					makeMusuh1(Number).

makeMusuh1(1)	:- makeMusuh2.
makeMusuh1(Number)	:- 	banyakMusuh(Banyak),
						Number =:= Banyak,
						makeMusuh1,
						X is Number-1,
						makeMusuh1(X).
makeMusuh1(Number)	:- 	banyakMusuh(Banyak),
						Number =\= Banyak,
						musuh(NamaMusuh,[A,B]),
						makeMusuh2,
						X is Number-1,
						makeMusuh1(X).







initialMap	:-	panjangMap(Panjang),lebarMap(Lebar) printMap1(Panjang,Lebar)
printMap1(0,0).
printMap1(Panjang,Lebar)	:-	isTopBorder(Panjang,Lebar),
								write('#'),
								pindahBaris(Panjang,Lebar,Y),
								printMap1(Y,Lebar).

printMap1(Panjang,Lebar)	:-	isLeftBorder(Panjang,Lebar),
								write('#'),
								pindahBaris(Panjang,Lebar,Y),
								printMap1(Y,Lebar).

printMap1(Panjang,Lebar)	:-	isRightBorder(Panjang,Lebar),
								write('#'),
								pindahBaris(Panjang,Lebar,Y),
								printMap1(Y,Lebar).

printMap1(Panjang,Lebar)	:-	isBottomBorder(Panjang,Lebar),
								write('#'),
								pindahBaris(Panjang,Lebar,Y),
								printMap1(Y,Lebar).
printMap1(Panjang,Lebar)	:-	

pindahBaris(Panjang,Lebar,Y)	:-	Lebar=:=0, Y is Panjang-1.
pindahBaris(Panjang,Lebar,Y)	:-	Lebar=\=0, Y is Panjang.





