:- dynamic(panjangMap/1).
:- dynamic(lebarMap/1).
:- dynamic(gym/1).            %gym([X,Y])
:- dynamic(player/1).         %player([X,Y])
:- dynamic(musuh/2).    %musuh(nama,[X,Y])
:- dynamic(battle/1).
:- dynamic(banyakMusuh/1).

/*	PRINT MAP 	*/
makeMap :-	random(15,20,Panjang),
           	random(10,15,Lebar),
           	asserta(panjangMap(Panjang)),
           	asserta(lebarMap(Lebar)).

isTopBorder(_,Y)	:- 	Y=:=0,!.
isBottomBorder(_,Y)	:- 	panjangMap(Panjang),
						Y=:=Panjang+1,!.
isRightBorder(X,_)	:-	lebarMap(Lebar),
						X=:=Lebar+1,!.
isLeftBorder(X,_)	:-	lebarMap(Lebar),
						X=:=0,!.

isNotTopBorder(_,Y)	:- 	Y=\=0,!.
isNotBottomBorder(_,Y)	:- 	panjangMap(Panjang),
							Y=\=Panjang+1,!.
isNotRightBorder(X,_)	:-	lebarMap(Lebar),
							X=\=Lebar+1,!.
isNotLeftBorder(X,_)	:-	lebarMap(Lebar),
							X=\=0,!.

initialMap	:-	makeMap,
				printMap1(0,0).

printMap1(Panjang,Lebar)	:- 	isTopBorder(Lebar,Panjang),
								isNotRightBorder(Lebar,Panjang),
								write('#'),
								Lnew is Lebar +1,
								printMap1(Panjang, Lnew).

printMap1(Panjang,Lebar)	:-	isLeftBorder(Lebar,Panjang),
								isNotTopBorder(Lebar,Panjang),
								write('#'),nl,
								Lnew is Lebar+1,
								printMap1(Panjang,Lnew).

printMap1(Panjang,Lebar)	:-	isRightBorder(Lebar,Panjang),
								isNotBottomBorder(Lebar,Panjang),
								write('#'),nl,
								X is Panjang+1,
								printMap1(X,0).

printMap1(Panjang,Lebar)	:-	isBottomBorder(Lebar,Panjang),
								isNotLeftBorder(Lebar,Panjang),
								isNotRightBorder(Lebar,Panjang),
								write('#'),
								Lnew is Lebar +1,
								printMap1(Panjang,Lnew).
printMap1(Panjang,Lebar)	:-	isRightBorder(Lebar,Panjang),
								isBottomBorder(Lebar,Panjang),
								write('#').

printMap1(Panjang,Lebar)	:-	isNotRightBorder(Lebar,Panjang),
								isNotLeftBorder(Lebar,Panjang),
								isNotBottomBorder(Lebar,Panjang),
								isNotTopBorder(Lebar,Panjang),
								write('-'),
								Lnew is Lebar+1,
								printMap1(Panjang,Lnew).