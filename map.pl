:- dynamic(panjangMap/1).
:- dynamic(lebarMap/1).
:- dynamic(musuh/2).    %musuh(nama,[X,Y])
:- dynamic(battle/1).
:- dynamic(banyakMusuh/1).
:- dynamic(storePosition/1).
:- dynamic(questPosition/1).
:- dynamic(dungeonPosition/1).
:- dynamic(playerPosition/1).


/* STORE */
store  :-  dungeonPosition([X,Y]),
   panjangMap(Panjang),
   lebarMap(Lebar),
   random(1,Panjang,Pjg),
   random(1,Lebar,Lbr),
   trialForStore(Pjg,Lbr,X,Y),!.
   

trialForStore(X1,Y1,X2,Y2) :- X1=\=X2,
        Y1=\=Y2,
        asserta(storePosition([X1,Y1])).

trialForStore(X1,Y1,X2,Y2) :- X1 =:= X2,
        Y1 =:= Y2,
        panjangMap(Panjang),
        lebarMap(Lebar),
        random(1,Panjang,Pjg),
        random(1,Lebar,Lbr),
        trialForStore(Pjg,Lbr,X2,Y2).

isStorePosition(X,Y) :- storePosition([X1,Y1]),
       X=:=X1,
       Y=:=Y1,!.

isNotStorePosition(X,Y) :- storePosition([X1,Y1]),
       X=\=X1,
       Y=\=Y1,!.

/* QUEST */
quest  :- storePosition([X2,Y2]),
   dungeonPosition([X1,Y1]),
   panjangMap(Panjang),
   lebarMap(Lebar),
   random(1,Panjang,Pjg),
   random(1,Lebar,Lbr),
   trialForQuest(Pjg,Lbr,X1,Y1,X2,Y2),!.

trialForQuest(X,Y,X1,Y1,X2,Y2) :- X=\=X1,
         X=\=X2,
         Y=\=Y1,
         Y=\=Y2,
         asserta(questPosition([X,Y])).

trialForQuest(X,Y,X1,Y1,X2,Y2) :- X=:=X1,
         Y=:=Y1,
         Y=\=Y2,
         X=\=X2,
         panjangMap(Panjang),
         lebarMap(Lebar),
         random(1,Panjang,Pjg),
         random(1,Lebar,Lbr),
         trialForQuest(Pjg,Lbr,X1,Y1,X2,Y2).

trialForQuest(X,Y,X1,Y1,X2,Y2) :- X=\=X1,
         Y=\=Y1,
         Y=:=Y2,
         X=:=X2,
         panjangMap(Panjang),
         lebarMap(Lebar),
         random(1,Panjang,Pjg),
         random(1,Lebar,Lbr),
         trialForQuest(Pjg,Lbr,X1,Y1,X2,Y2).

isQuestPosition(X,Y) :-  questPosition([X1,Y1]),
       X=:=X1,
       Y=:=Y1,!.

isNotQuestPosition(X,Y) :-  questPosition([X1,Y1]),
       X=\=X1,
       Y=\=Y1,!.

/* PLAYER  */
player  :-  dungeonPosition([X1,Y1]),
   storePosition([X2,Y2]),
   questPosition([X3,Y3]),
   panjangMap(Panjang),
   lebarMap(Lebar),
   random(1,Panjang,Pjg),
   random(1,Lebar,Lbr),
   triaForPlayer(Pjg,Lbr,X1,Y1,X2,Y2,X3,Y3),!.

triaForPlayer(X,Y,X1,Y1,X2,Y2,X3,Y3) :-  X=\=X1,
           Y=\=Y1,
           Y=\=Y2,
           X=\=X2,
           X=\=X3,
           Y=\=Y3,
           asserta(playerPosition([X,Y])).

triaForPlayer(X,Y,X1,Y1,X2,Y2,X3,Y3) :-  X=:=X1,
           Y=:=Y1,
           Y=\=Y2,
           X=\=X2,
           X=\=X3,
           Y=\=Y3,
           panjangMap(Panjang),
           lebarMap(Lebar),
           random(1,Panjang,Pjg),
           random(1,Lebar,Lbr),
           triaForPlayer(Pjg,Lbr,X1,Y1,X2,Y2,X3,Y3).

triaForPlayer(X,Y,X1,Y1,X2,Y2,X3,Y3) :-  X=\=X1,
           Y=\=Y1,
           Y=:=Y2,
           X=:=X2,
           X=\=X3,
           Y=\=Y3,
           panjangMap(Panjang),
           lebarMap(Lebar),
           random(1,Panjang,Pjg),
           random(1,Lebar,Lbr),
           triaForPlayer(Pjg,Lbr,X1,Y1,X2,Y2,X3,Y3).

triaForPlayer(X,Y,X1,Y1,X2,Y2,X3,Y3) :-  X=\=X1,
           Y=\=Y1,
           Y=\=Y2,
           X=\=X2,
           X=:=X3,
           Y=:=Y3,
           panjangMap(Panjang),
           lebarMap(Lebar),
           random(1,Panjang,Pjg),
           random(1,Lebar,Lbr),
           triaForPlayer(Pjg,Lbr,X1,Y1,X2,Y2,X3,Y3).

isPlayerPosition(X,Y) :-  playerPosition([X1,Y1]),
       X=:=X1,
       Y=:=Y1,!.

isNotPlayerPosition(X,Y) :- playerPosition([X1,Y1]),
        X=\=X1,
        Y=\=Y1,!.


/*	DUNGEON 	*/
dungeon:- 	panjangMap(Panjang),
			lebarMap(Lebar),
			P is Panjang+1,
			L is Lebar+1,
			random(1,P,Pjg),
			random(1,L,Lbr),
			asserta(dungeonPosition([Pjg,Lbr])),!.

isDungeonPosition(X,Y)	:- 	dungeonPosition([X1,Y1]),!,
							X=:=X1,
							Y=:=Y1,!.

isNotDungeonPosition(X,Y)	:- 	dungeonPosition([X1,Y1]),!,
								X=\=X1,
								Y=\=Y1,!.


makeMap :-	random(15,20,Panjang),
           	random(10,40,Lebar),
			asserta(panjangMap(Panjang)),
           	asserta(lebarMap(Lebar)).

isTopBorder(X,_)	:- 	panjangMap(Panjang),
						Pjg is Panjang+1,
						X =:= Pjg,!.
isBottomBorder(X,_)	:- 	X=:=0,!.
isRightBorder(_,Y)	:-	Y=:=0,!.
isLeftBorder(_,Y)	:-	lebarMap(Lebar),
						Lbr is Lebar+1,
						Lbr =:= Y,!.

isNotTopBorder(X,_)	:- 	panjangMap(Panjang),
						Pjg is Panjang+1,
						X =\= Pjg,!.
isNotBottomBorder(X,_)	:- 	X=\=0,!.
isNotRightBorder(_,Y)	:-	Y=\=0,!.
isNotLeftBorder(_,Y)	:-	lebarMap(Lebar),
							Lbr is Lebar+1,
							Lbr =\= Y,!.
describeMap	:-	panjangMap(Panjang),
				lebarMap(Lebar),
				Pjg is Panjang+1,
				Lbr is Lebar+1,
				printMap1(Pjg,Lbr),!.


printMap1(Panjang,Lebar)	:- 	isRightBorder(Panjang,Lebar),
								isBottomBorder(Panjang,Lebar),
								write('#').

printMap1(Panjang,Lebar)	:- 	isRightBorder(Panjang,Lebar),
								isNotBottomBorder(Panjang,Lebar),
								write('#'),nl,
								Pjg is Panjang-1,
								lebarMap(Lbr),
								Lbrn is Lbr+1,
								printMap1(Pjg,Lbrn).

printMap1(Panjang,Lebar)	:-	isTopBorder(Panjang,Lebar),
								isNotRightBorder(Panjang,Lebar),
								write('#'),
								Lbr is Lebar-1,
								printMap1(Panjang,Lbr).

printMap1(Panjang,Lebar)	:-	isLeftBorder(Panjang,Lebar),
								isNotTopBorder(Panjang,Lebar),
								isNotBottomBorder(Panjang,Lebar),
								write('#'),
								Lbr is Lebar-1,
								printMap1(Panjang,Lbr).

printMap1(Panjang,Lebar)	:-	isBottomBorder(Panjang,Lebar),
								isNotRightBorder(Panjang,Lebar),
								write('#'),
								Lbr is Lebar-1,
								printMap1(Panjang,Lbr).

printMap1(Panjang,Lebar)	:-	isNotRightBorder(Panjang,Lebar),
								isNotBottomBorder(Panjang,Lebar),
								isNotTopBorder(Panjang,Lebar),
								isNotLeftBorder(Panjang,Lebar),
								isDungeonPosition(Panjang,Lebar),
								write('D'),
								Lbr is Lebar-1,
								printMap1(Panjang,Lbr).

printMap1(Panjang,Lebar)	:-	isNotRightBorder(Panjang,Lebar),
								isNotBottomBorder(Panjang,Lebar),
								isNotTopBorder(Panjang,Lebar),
								isNotLeftBorder(Panjang,Lebar),
								isStorePosition(Panjang,Lebar),
								write('S'),
								Lbr is Lebar-1,
								printMap1(Panjang,Lbr).

printMap1(Panjang,Lebar)	:-	isNotRightBorder(Panjang,Lebar),
								isNotBottomBorder(Panjang,Lebar),
								isNotTopBorder(Panjang,Lebar),
								isNotLeftBorder(Panjang,Lebar),
								isQuestPosition(Panjang,Lebar),
								write('Q'),
								Lbr is Lebar-1,
								printMap1(Panjang,Lbr).

printMap1(Panjang,Lebar)	:-	isNotRightBorder(Panjang,Lebar),
								isNotBottomBorder(Panjang,Lebar),
								isNotTopBorder(Panjang,Lebar),
								isNotLeftBorder(Panjang,Lebar),
								isPlayerPosition(Panjang,Lebar),
								write('P'),
								Lbr is Lebar-1,
								printMap1(Panjang,Lbr).

printMap1(Panjang,Lebar)	:-	isNotRightBorder(Panjang,Lebar),
								isNotBottomBorder(Panjang,Lebar),
								isNotTopBorder(Panjang,Lebar),
								isNotLeftBorder(Panjang,Lebar),
								write('-'),
								Lbr is Lebar-1,
								printMap1(Panjang,Lbr).

				
/*	Mengosongkan dynamic Predicate	*/
hapus	:- 	retract(panjangMap(Panjang)),
			retract(lebarMap(Lebar)),
			retract(storePosition([X,Y])),
			retract(dungeonPosition([X1,Y1])),
			retract(questPosition([X2,Y2])),
			retract(playerPosition([X3,Y3])).

/* Memanggil Map acak	*/
initialMap	:-	makeMap,dungeon,store,quest,player,describeMap,hapus,!.


