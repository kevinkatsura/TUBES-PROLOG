:- dynamic(panjangMap/1).
:- dynamic(lebarMap/1).
:- dynamic(musuh/2).    %musuh(nama,[X,Y])
:- dynamic(battle/1).
:- dynamic(banyakMusuh/1).
:- dynamic(storePosition/1).
:- dynamic(questPosition/1).
:- dynamic(dungeonPosition/1).
:- dynamic(playerPosition/1).
:- dynamic(getStore/0).
:- dynamic(noMap/0).
noMap.

/*		MOVEMENT		*/
/*	W 	*/
w 	:- 	playerPosition([X,Y]), A is X+1, isTopBorder(A,Y),!.
w 	:- 	playerPosition([X,Y]), A is X+1, isDungeonPosition(A,Y),
		A is X+1, 
		B = Y, 
		retract(playerPosition([X,Y])),
		asserta(playerPosition([A,B])),nl,
		write('-->>> You\'ve entered Dungeon Boss <<<--'),nl,nl,
		foundDungeon,statusEnemy(boss),nl,nl,
		write('-->>> attack / run '),!.
w 	:- 	playerPosition([X,Y]), A is X+1, isStorePosition(A,Y),asserta(getStore),
		A is X+1, 
		B = Y, 
		retract(playerPosition([X,Y])),
		asserta(playerPosition([A,B])),!.
w 	:- 	playerPosition([X,Y]), A is X+1, isQuestPosition(A,Y),getQuest,
		A is X+1, 
		B = Y, 
		retract(playerPosition([X,Y])),
		asserta(playerPosition([A,B])),!.
w 	:- 	playerPosition([X,Y]), A is X+1, isEnemyPosition(A,Y),
		A is X+1, 
		B = Y, 
		retract(playerPosition([X,Y])),
		asserta(playerPosition([A,B])),
		musuh(C,[A,B]),
		write('-->>> There is a '),write(C),nl,nl,
		statusEnemy(C),found(C),nl,nl,
		write('-->>> attack / run '),!.
w 	:- 	playerPosition([X,Y]), 
		A is X+1, 
		B = Y, 
		retract(playerPosition([X,Y])),
		asserta(playerPosition([A,B])),!.

/*	A 	*/
a 	:- 	playerPosition([X,Y]), B is Y+1, isLeftBorder(X,B),!.
a 	:- 	playerPosition([X,Y]), B is Y+1, isDungeonPosition(X,B),
		B is Y+1, 
		A = X, 
		retract(playerPosition([X,Y])),
		asserta(playerPosition([A,B])),
		write('-->>> You\'ve entered Dungeon Boss <<<--'),nl,nl,
		foundDungeon,statusEnemy(boss),nl,nl,
		write('-->>> attack / run '),!.
a 	:- 	playerPosition([X,Y]), B is Y+1, isStorePosition(X,B),asserta(getStore),
		B is Y+1, 
		A = X, 
		retract(playerPosition([X,Y])),
		asserta(playerPosition([A,B])),!.
a 	:- 	playerPosition([X,Y]), B is Y+1, isQuestPosition(X,B),getQuest,
		B is Y+1, 
		A = X, 
		retract(playerPosition([X,Y])),
		asserta(playerPosition([A,B])),!.
a 	:- 	playerPosition([X,Y]), B is Y+1, isEnemyPosition(X,B),
		B is Y+1, 
		A = X, 
		retract(playerPosition([X,Y])),
		asserta(playerPosition([A,B])),
		musuh(C,[A,B]),
		write('-->>> There is a '),write(C),nl,nl,
		statusEnemy(C),found(C),nl,nl,
		write('-->>> attack / run '),!.
a 	:- 	playerPosition([X,Y]), 
		B is Y+1, 
		A = X, 
		retract(playerPosition([X,Y])),
		asserta(playerPosition([A,B])),!.

/*	S 	*/
s 	:- 	playerPosition([X,Y]), A is X-1, isBottomBorder(A,Y),!.
s 	:- 	playerPosition([X,Y]), A is X-1, isDungeonPosition(A,Y),
		A is X-1, 
		B = Y, 
		retract(playerPosition([X,Y])),
		asserta(playerPosition([A,B])),
		write('-->>> You\'ve entered Dungeon Boss <<<--'),nl,nl,
		foundDungeon,statusEnemy(boss),nl,nl,
		write('-->>> attack / run '),!.
s 	:- 	playerPosition([X,Y]), A is X-1, isStorePosition(A,Y),asserta(getStore),
		A is X-1, 
		B = Y, 
		retract(playerPosition([X,Y])),
		asserta(playerPosition([A,B])),!.
s 	:- 	playerPosition([X,Y]), A is X-1, isQuestPosition(A,Y),getQuest,
		A is X-1, 
		B = Y, 
		retract(playerPosition([X,Y])),
		asserta(playerPosition([A,B])),!.
s 	:- 	playerPosition([X,Y]), A is X-1, isEnemyPosition(A,Y),
		A is X-1, 
		B = Y, 
		retract(playerPosition([X,Y])),
		asserta(playerPosition([A,B])),
		musuh(C,[A,B]),
		write('-->>> There is a '),write(C),nl,nl,
		statusEnemy(C),found(C),nl,nl,
		write('-->>> attack / run '),!.
s 	:- 	playerPosition([X,Y]), 
		A is X-1, 
		B = Y, 
		retract(playerPosition([X,Y])),
		asserta(playerPosition([A,B])),!.

/*	D 	*/
d 	:- 	playerPosition([X,Y]), B is Y-1, isRightBorder(X,B),!.
d 	:- 	playerPosition([X,Y]), B is Y-1, isDungeonPosition(X,B),
		B is Y-1, 
		A = X, 
		retract(playerPosition([X,Y])),
		asserta(playerPosition([A,B])),
		write('-->>> You\'ve entered Dungeon Boss <<<--'),nl,nl,
		foundDungeon,statusEnemy(boss),nl,nl,
		write('-->>> attack / run '),!.
d 	:- 	playerPosition([X,Y]), B is Y-1, isStorePosition(X,B),asserta(getStore),
		B is Y-1, 
		A = X, 
		retract(playerPosition([X,Y])),
		asserta(playerPosition([A,B])),!.
d 	:- 	playerPosition([X,Y]), B is Y-1, isQuestPosition(X,B),getQuest,
		B is Y-1, 
		A = X, 
		retract(playerPosition([X,Y])),
		asserta(playerPosition([A,B])),!.
d 	:- 	playerPosition([X,Y]), B is Y-1, isEnemyPosition(X,B),
		B is Y-1, 
		A = X, 
		retract(playerPosition([X,Y])),
		asserta(playerPosition([A,B])),
		musuh(C,[A,B]),
		write('-->>> There is a '),write(C),nl,nl,
		statusEnemy(C),found(C),nl,nl,
		write('-->>> attack / run '),!.
d 	:- 	playerPosition([X,Y]), 
		B is Y-1, 
		A = X, 
		retract(playerPosition([X,Y])),
		asserta(playerPosition([A,B])),!.


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



/* STORE */
store  :-  dungeonPosition([X,Y]),
   panjangMap(Panjang),
   lebarMap(Lebar),
   random(1,Panjang,Pjg),
   random(1,Lebar,Lbr),
   trialForStore(Pjg,Lbr,X,Y),!.

trialForStore(X1,Y1,X2,Y2) :- X1 =:= X2,
        Y1 =:= Y2,
        panjangMap(Panjang),
        lebarMap(Lebar),
        random(1,Panjang,Pjg),
        random(1,Lebar,Lbr),
        trialForStore(Pjg,Lbr,X2,Y2).

trialForStore(X1,Y1,_X2,_Y2) :- 
        asserta(storePosition([X1,Y1])).

isStorePosition(X,Y) :- storePosition([X1,Y1]),
       X=:=X1,
       Y=:=Y1,!.


/* QUEST */
questP  :- storePosition([X2,Y2]),
   dungeonPosition([X1,Y1]),
   panjangMap(Panjang),
   lebarMap(Lebar),
   random(1,Panjang,Pjg),
   random(1,Lebar,Lbr),
   trialForQuest(Pjg,Lbr,X1,Y1,X2,Y2),!.


trialForQuest(X,Y,X1,Y1,_A,_B) :- 
		 X=:=X1,
         Y=:=Y1,
         panjangMap(Panjang),
         lebarMap(Lebar),
         random(1,Panjang,Pjg),
         random(1,Lebar,Lbr),
         trialForQuest(Pjg,Lbr,X1,Y1,_A,_B).

trialForQuest(X,Y,_A,_B,X2,Y2) :- 
         Y=:=Y2,
         X=:=X2,
         panjangMap(Panjang),
         lebarMap(Lebar),
         random(1,Panjang,Pjg),
         random(1,Lebar,Lbr),
         trialForQuest(Pjg,Lbr,_A,_B,X2,Y2).

trialForQuest(X,Y,_X1,_Y1,_X2,_Y2) :- 
         asserta(questPosition([X,Y])).



isQuestPosition(X,Y) :-  questPosition([X1,Y1]),
       X=:=X1,
       Y=:=Y1,!.


/* PLAYER  */
player  :- dungeonPosition([X1,Y1]),
		   storePosition([X2,Y2]),
		   questPosition([X3,Y3]),
		   panjangMap(Panjang),
		   lebarMap(Lebar),
		   random(1,Panjang,Pjg),
		   random(1,Lebar,Lbr),
		   triaForPlayer(Pjg,Lbr,X1,Y1,X2,Y2,X3,Y3),!.

triaForPlayer(X,Y,X1,Y1,_X2,_Y2,_X3,_Y3) :-  
		   X=:=X1,
           Y=:=Y1,
           panjangMap(Panjang),
           lebarMap(Lebar),
           random(1,Panjang,Pjg),
           random(1,Lebar,Lbr),
           triaForPlayer(Pjg,Lbr,X1,Y1,_X2,_Y2,_X3,_Y3).

triaForPlayer(X,Y,_X1,_Y1,X2,Y2,_X3,_Y3) :-
           Y=:=Y2,
           X=:=X2,
           panjangMap(Panjang),
           lebarMap(Lebar),
           random(1,Panjang,Pjg),
           random(1,Lebar,Lbr),
           triaForPlayer(Pjg,Lbr,_X1,_Y1,X2,Y2,_X3,_Y3).

triaForPlayer(X,Y,_X1,_Y1,_X2,_Y2,X3,Y3) :-
           X=:=X3,
           Y=:=Y3,
           panjangMap(Panjang),
           lebarMap(Lebar),
           random(1,Panjang,Pjg),
           random(1,Lebar,Lbr),
           triaForPlayer(Pjg,Lbr,_X1,_Y1,_X2,_Y2,X3,Y3).

triaForPlayer(X,Y,_X1,_Y1,_X2,_Y2,_X3,_Y3) :-
           asserta(playerPosition([X,Y])).


isPlayerPosition(X,Y) :-  playerPosition([X1,Y1]),
       X=:=X1,
       Y=:=Y1,!.


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
					X3 is ceiling(X2),
					random(10,X3,Number),
					asserta(banyakMusuh(Number)),
					createEnemy(Number),!.

makeMusuh1(PjgE,LbrE,X1,Y1,_X2,_Y2,_X3,_Y3,_X4,_Y4) 	:-	PjgE==X1,
															LbrE==Y1,
															panjangMap(Panjang),
															lebarMap(Lebar),
															Pjg is Panjang+1,
															Lbr is Lebar+1,
															random(1,Pjg,PjgN),
															random(1,Lbr,LbrN),
															makeMusuh1(PjgN,LbrN,X1,Y1,_X2,_Y2,_X3,_Y3,_X4,_Y4).

makeMusuh1(PjgE,_LbrE,_X1,_Y1,X2,Y2,_X3,_Y3,_X4,_Y4) 	:-	PjgE==X2,
															Lbr==Y2,
															panjangMap(Panjang),
															lebarMap(Lebar),
															Pjg is Panjang+1,
															Lbr is Lebar+1,
															random(1,Pjg,PjgN),
															random(1,Lbr,LbrN),
															makeMusuh1(PjgN,LbrN,_X1,_Y1,X2,Y2,_X3,_Y3,_X4,_Y4).

makeMusuh1(PjgE,LbrE,_X1,_Y1,_X2,_Y2,X3,Y3,_X4,_Y4) 	:-	PjgE==X3,
															LbrE==Y3,
															panjangMap(Panjang),
															lebarMap(Lebar),
															Pjg is Panjang+1,
															Lbr is Lebar+1,
															random(1,Pjg,PjgN),
															random(1,Lbr,LbrN),
															makeMusuh1(PjgN,LbrN,_X1,_Y1,_X2,_Y2,X3,Y3,_X4,_Y4).

makeMusuh1(PjgE,LbrE,_X1,_Y1,_X2,_Y2,_X3,_Y3,X4,Y4) 	:-	PjgE==X4,
															LbrE==Y4,
															panjangMap(Panjang),
															lebarMap(Lebar),
															Pjg is Panjang+1,
															Lbr is Lebar+1,
															random(1,Pjg,PjgN),
															random(1,Lbr,LbrN),
															makeMusuh1(PjgN,LbrN,_X1,_Y1,_X2,_Y2,_X3,_Y3,X4,Y4).

makeMusuh1(PjgE,LbrE,_X1,_Y1,_X2,_Y2,_X3,_Y3,_X4,_Y4) 	:-	musuh(_,[A,B]),
															PjgE==A,
															LbrE==B,
															panjangMap(Panjang),
															lebarMap(Lebar),
															Pjg is Panjang+1,
															Lbr is Lebar+1,
															random(1,Pjg,PjgN),
															random(1,Lbr,LbrN),
															makeMusuh1(PjgN,LbrN,_X1,_Y1,_X2,_Y2,_X3,_Y3,_X4,_Y4).

makeMusuh1(PjgE,LbrE,_,_,_,_,_,_,_,_) 	:-	random(1,4,NoMusuh),
											enemy(NoMusuh,NamaMusuh),
											asserta(musuh(NamaMusuh,[PjgE,LbrE])).

createEnemy(0).

createEnemy(Number)	:-	panjangMap(Panjang),
						lebarMap(Lebar),
						Pjg is Panjang+1,
						Lbr is Lebar+1,
						random(1,Pjg,PjgE),
						random(1,Lbr,LbrE),
						dungeonPosition([X1,Y1]),
						storePosition([X2,Y2]),
						questPosition([X3,Y3]),
						playerPosition([X4,Y4]),
						makeMusuh1(PjgE,LbrE,X1,Y1,X2,Y2,X3,Y3,X4,Y4),
						NewNumber is Number-1,
						createEnemy(NewNumber).

/*		MENENTUKAN APAKAH ENEMY ADA DI TITIK	*/
isEnemyPosition(Panjang,Lebar)	:-	musuh(_,[A,B]),
									Panjang=:=A,
									Lebar=:=B,!.
isEnemy1Position(Panjang,Lebar)	:-	musuh(C,[A,B]),
									Panjang=:=A,
									Lebar=:=B,
									C == 'slime',!.

isEnemy2Position(Panjang,Lebar)	:-	musuh(C,[A,B]),
									Panjang=:=A,
									Lebar=:=B,
									C == 'goblin',!.

isEnemy3Position(Panjang,Lebar)	:-	musuh(C,[A,B]),
									Panjang=:=A,
									Lebar=:=B,
									C == 'wolf',!.


/*		PRINT MAP 		*/

randomMap :-	random(15,20,Panjang),
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

describeMap1	:-	panjangMap(Panjang),
					lebarMap(Lebar),
					Pjg is Panjang+1,
					Lbr is Lebar+1,nl,
					write('-->> Map of World'),nl,nl,
					printMap1(Pjg,Lbr),!.
describeMap2	:-	panjangMap(Panjang),
					lebarMap(Lebar),
					Pjg is Panjang+1,
					Lbr is Lebar+1,
					nl,write('-->> Map of God'),nl,
					write('-->> Let see who you are!'),nl,nl,
					printMap2(Pjg,Lbr),!.

/*Print Map Tanpa Enemy*/
printMap1(Panjang,Lebar)	:- 	isRightBorder(Panjang,Lebar),
								isBottomBorder(Panjang,Lebar),
								write('#'),nl.

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

printMap1(Panjang,Lebar)	:-	isPlayerPosition(Panjang,Lebar),
								write('P'),
								Lbr is Lebar-1,
								printMap1(Panjang,Lbr).

printMap1(Panjang,Lebar)	:-	isDungeonPosition(Panjang,Lebar),
								write('D'),
								Lbr is Lebar-1,
								printMap1(Panjang,Lbr).

printMap1(Panjang,Lebar)	:-	isStorePosition(Panjang,Lebar),
								write('S'),
								Lbr is Lebar-1,
								printMap1(Panjang,Lbr).

printMap1(Panjang,Lebar)	:-	isQuestPosition(Panjang,Lebar),
								write('Q'),
								Lbr is Lebar-1,
								printMap1(Panjang,Lbr).

printMap1(Panjang,Lebar)	:-	write('-'),
								Lbr is Lebar-1,
								printMap1(Panjang,Lbr).

/*Print Map Dengan Enemy*/
printMap2(Panjang,Lebar)	:- 	isRightBorder(Panjang,Lebar),
								isBottomBorder(Panjang,Lebar),
								write('#'),nl.

printMap2(Panjang,Lebar)	:- 	isRightBorder(Panjang,Lebar),
								isNotBottomBorder(Panjang,Lebar),
								write('#'),nl,
								Pjg is Panjang-1,
								lebarMap(Lbr),
								Lbrn is Lbr+1,
								printMap2(Pjg,Lbrn).

printMap2(Panjang,Lebar)	:-	isTopBorder(Panjang,Lebar),
								isNotRightBorder(Panjang,Lebar),
								write('#'),
								Lbr is Lebar-1,
								printMap2(Panjang,Lbr).

printMap2(Panjang,Lebar)	:-	isLeftBorder(Panjang,Lebar),
								isNotTopBorder(Panjang,Lebar),
								isNotBottomBorder(Panjang,Lebar),
								write('#'),
								Lbr is Lebar-1,
								printMap2(Panjang,Lbr).

printMap2(Panjang,Lebar)	:-	isBottomBorder(Panjang,Lebar),
								isNotRightBorder(Panjang,Lebar),
								write('#'),
								Lbr is Lebar-1,
								printMap2(Panjang,Lbr).

printMap2(Panjang,Lebar)	:-	isPlayerPosition(Panjang,Lebar),
								write('P'),
								Lbr is Lebar-1,
								printMap2(Panjang,Lbr).

printMap2(Panjang,Lebar)	:-	isDungeonPosition(Panjang,Lebar),
								write('D'),
								Lbr is Lebar-1,
								printMap2(Panjang,Lbr).

printMap2(Panjang,Lebar)	:-	isStorePosition(Panjang,Lebar),
								write('S'),
								Lbr is Lebar-1,
								printMap2(Panjang,Lbr).

printMap2(Panjang,Lebar)	:-	isQuestPosition(Panjang,Lebar),
								write('Q'),
								Lbr is Lebar-1,
								printMap2(Panjang,Lbr).

printMap2(Panjang,Lebar)	:-	isEnemy1Position(Panjang,Lebar),
								write('X'),
								Lbr is Lebar-1,
								printMap2(Panjang,Lbr).

printMap2(Panjang,Lebar)	:-	isEnemy2Position(Panjang,Lebar),
								write('Y'),
								Lbr is Lebar-1,
								printMap2(Panjang,Lbr).

printMap2(Panjang,Lebar)	:-	isEnemy3Position(Panjang,Lebar),
								write('Z'),
								Lbr is Lebar-1,
								printMap2(Panjang,Lbr).

printMap2(Panjang,Lebar)	:-	write('-'),
								Lbr is Lebar-1,
								printMap2(Panjang,Lbr).
				
/*	Mengosongkan dynamic Predicate	*/
hapusMap			:- 	retract(panjangMap(_Panjang)),
						retract(lebarMap(_Lebar)).
hapusStore			:-	retract(storePosition([_X,_Y])).
hapusDungeon		:-	retract(dungeonPosition([_X1,_Y1])).
hapusQuest			:-	retract(questPosition([_X2,_Y2])).
hapusPlayer			:-	retract(playerPosition([_X3,_Y3])).
hapusE				:-	retractall(musuh(_A,[_B,_C])).
hapusBanyakMusuh	:-	retractall(banyakMusuh(_X)).
hapus 				:-	hapusMap,
						hapusStore,
						hapusDungeon,
						hapusQuest,
						hapusPlayer,
						hapusE,
						hapusBanyakMusuh,!.

map:-	isPlay, noMap,!,retract(noMap), 
		randomMap, dungeon, store, questP, player, makeMusuhAwal, describeMap1.
map:-	isPlay,
		describeMap1,!.

teleport:- hapusPlayer,player.
teleportS	:-	hapusPlayer,
				storePosition([X1,Y1]),
				asserta(playerPosition([X1,Y1])).
teleportQ	:-	hapusPlayer,
				questPosition([X1,Y1]),
				asserta(playerPosition([X1,Y1])).
teleportD	:-	hapusPlayer,
				dungeonPosition([X1,Y1]),
				asserta(playerPosition([X1,Y1])).
