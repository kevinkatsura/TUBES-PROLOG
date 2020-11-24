:- dynamic(panjangMap/1).
:- dynamic(lebarMap/1).
:- dynamic(musuh/2).    %musuh(nama,[X,Y])
:- dynamic(battle/1).
:- dynamic(banyakMusuh/1).
:- dynamic(storePosition/1).
:- dynamic(questPosition/1).
:- dynamic(dungeonPosition/1).
:- dynamic(playerPosition/1).


posisiPlayer	:- 	panjangMap(Panjang),
					lebarMap(Lebar),
					random(1,Panjang,BarisPlayer),
					random(1,Lebar,KolomPlayer),
					asserta(player([BarisPlayer,KolomPlayer])).


/*			BUAT MUSUH 			*/

/*	daftar musuh */
enemy(1,slime).
enemy(2,goblin).
enemy(3,wolf).
enemy(4,dungeon).

/*	Fungsi	*/
makeMusuhAwal	:-	panjangMap(Panjang),
					lebarMap(Lebar),
					X1 is Panjang*Lebar,
					X2 is X1/2,
					random(1,X2,Number),
					asserta(banyakMusuh(Number)).
					createEnemy(Number).

makeMusuh2	:-	
				random(1,3,Number),
				musuh(_,[A,B]),!,
				A =\= X,
				B =\= Y,
				enemy(Number,NamaMusuh),
				asserta(musuh(NamaMusuh,[X,Y])).

makeMusuh2	:-	panjangMap(Panjang),
				lebarMap(Lebar),
				random(1,Panjang,X),
				random(1,Lebar,Y),
				random(1,3,Number),
				musuh(_,[A,B]),!,
				A =:= X,
				B =:= Y.

makeMusuh1	:-	panjangMap(Panjang),
				lebarMap(Lebar),
				random(1,Panjang,X),
				random(1,Lebar,Y),
				random(1,3,Number),
				musuh(_,[A,B]),
				enemy(Number,NamaMusuh),
				asserta(musuh(NamaMusuh,[X,Y])).

createEnemy(1)	:- makeMusuh2.
createEnemy(Number)	:- 	banyakMusuh(Banyak),
						Number =:= Banyak,
						makeMusuh1,
						X is Number-1,
						createEnemy(X).

createEnemy(Number)	:- 	banyakMusuh(Banyak),
						Number =\= Banyak,
						panjangMap(Panjang),
						lebarMap(Lebar),
						random(1,Panjang,X),
						random(1,Lebar,Y),
						musuh(NamaMusuh,[A,B]),
						makeMusuh2,
						X is Number-1,
						createEnemy(X).

/* STORE */
store  :-  dungeonPosition([X,Y]),
   panjangMap(Panjang),
   lebarMap(Lebar),
   random(1,Panjang,Pjg),
   random(1,Lebar,Lbr),
   trialForStore(Pjg,Lbr,X,Y).
   

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
   trial(Pjg,Lbr,X1,Y1),
   trialForQuest(Pjg,Lbr,X1,Y1,X2,Y2).

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
   triaForPlayer(Pjg,Lbr,X1,Y1,X2,Y2,X3,Y3).

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

/* DUNGEON  */
dungeon:-  panjangMap(Panjang),
   lebarMap(Lebar),
   asserta(dungeonPosition([Panjang,Lebar])).

isDungeonPosition(X,Y) :-  dungeonPosition([X1,Y1]),
       X=:=X1,
       Y=:=Y1,!.

isNotDungeonPosition(X,Y) :- dungeonPosition([X1,Y1]),
        X=\=X1,
        Y=\=Y1,!.

/*	PRINT MAP 	*/

makeMap :-	random(15,20,Panjang),
           	random(10,40,Lebar),
           	asserta(panjangMap(20)),
           	asserta(lebarMap(10)).

isTopBorder(_,Y)	:- 	Y=:=0,!.
isBottomBorder(_,Y)	:- 	panjangMap(Panjang),
						Y1 is Panjang+1,
						Y=:=Y1,!.
isRightBorder(X,_)	:-	lebarMap(Lebar),
						X1 is Lebar+1,
						X=:=X1,!.
isLeftBorder(X,_)	:-	X=:=0,!.

isNotTopBorder(_,Y)	:- 	Y=\=0,!.
isNotBottomBorder(_,Y)	:- 	panjangMap(Panjang),
							Y1 is Panjang+1,
							Y=\=Y1,!.
isNotRightBorder(X,_)	:-	lebarMap(Lebar),
							X1 is Lebar+1,
							X=\=X1,!.
isNotLeftBorder(X,_)	:-	X=\=0,!.

initialMap	:-	makeMap,
				dungeon,
				store,
				quest,
				player,
				printMap1(0,0),!.

printMap1(Panjang,Lebar)	:-	lebarMap(Lbr),
								panjangMap(Pjg),
								Pjg1 is Pjg+1,
								Panjang =:= Pjg1,
								Lbr1 is Lbr+1,
								Lebar =:= Lbr1,
								write('#'),nl.

printMap1(Panjang,Lebar)	:- 	isTopBorder(Lebar,Panjang),
								isNotRightBorder(Lebar,Panjang),
								write('#'),
								Lnew is Lebar +1,
								printMap1(Panjang, Lnew).

printMap1(Panjang,Lebar)	:-	isLeftBorder(Lebar,Panjang),
								isNotTopBorder(Lebar,Panjang),
								write('#'),
								Lnew is Lebar+1,
								printMap1(Panjang,Lnew).

printMap1(Panjang,Lebar)	:-	isRightBorder(Lebar,Panjang),
								isNotBottomBorder(Lebar,Panjang),
								write('#'),nl,
								X is Panjang+1,
								Y = 0,
								printMap1(X,Y).

printMap1(Panjang,Lebar)	:-	isBottomBorder(Lebar,Panjang),
								isNotLeftBorder(Lebar,Panjang),
								isNotRightBorder(Lebar,Panjang),
								write('#'),
								Lnew is Lebar +1,
								printMap1(Panjang,Lnew).

printMap1(Panjang,Lebar)	:-	isNotRightBorder(Lebar,Panjang),
								isNotLeftBorder(Lebar,Panjang),
								isNotBottomBorder(Lebar,Panjang),
								isNotTopBorder(Lebar,Panjang),
								isNotStorePosition(Panjang,Lebar),
								isNotDungeonPosition(Panjang,Lebar),
								isNotPlayerPosition(Panjang,Lebar),
								isNotQuestPosition(Panjang,Lebar),
								write('-'),
								Lnew is Lebar+1,
								printMap1(Panjang,Lnew).

printMap1(Panjang,Lebar)	:-	isNotRightBorder(Lebar,Panjang),
								isNotLeftBorder(Lebar,Panjang),
								isNotBottomBorder(Lebar,Panjang),
								isNotTopBorder(Lebar,Panjang),
								isStorePosition(Panjang,Lebar),
								write('S'),
								Lnew is Lebar+1,
								printMap1(Panjang,Lnew).

printMap1(Panjang,Lebar)	:-	isNotRightBorder(Lebar,Panjang),
								isNotLeftBorder(Lebar,Panjang),
								isNotBottomBorder(Lebar,Panjang),
								isNotTopBorder(Lebar,Panjang),
								isDungeonPosition(Panjang,Lebar),
								write('D'),
								Lnew is Lebar+1,
								printMap1(Panjang,Lnew).

printMap1(Panjang,Lebar)	:-	isNotRightBorder(Lebar,Panjang),
								isNotLeftBorder(Lebar,Panjang),
								isNotBottomBorder(Lebar,Panjang),
								isNotTopBorder(Lebar,Panjang),
								isQuestPosition(Panjang,Lebar),
								write('Q'),
								Lnew is Lebar+1,
								printMap1(Panjang,Lnew).

printMap1(Panjang,Lebar)	:-	isNotRightBorder(Lebar,Panjang),
								isNotLeftBorder(Lebar,Panjang),
								isNotBottomBorder(Lebar,Panjang),
								isNotTopBorder(Lebar,Panjang),
								isPlayerPosition(Panjang,Lebar),
								write('P'),
								Lnew is Lebar+1,
								printMap1(Panjang,Lnew).







