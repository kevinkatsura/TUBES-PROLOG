:-dynamic(enemyHP/1).
:-dynamic(enemyAtk/1).
:-dynamic(enemyDfs/1).
:-dynamic(enemyExp/1).
:-dynamic(isBattle/0).
levelM(3).

found(X):-	levelM(Y),enemyHP(R),enemyAtk(S),enemyDfs(T),write('You found a '),write(X),nl,
		write('Level: '),write(Y),nl,
		write('Health: '),write(R),nl,
		write('Attack: '),write(S),nl,
		write('Defense: '),write(T),nl,nl,
		write('What will you do?'),asserta(isBattle),!.	

foundDungeon:-	levelM(Y),enemyHP(R),enemyAtk(S),enemyDfs(T),write('You found a dungeon'),nl,
		write('Level: '),write(Y),nl,
		write('Health: '),write(R),nl,
		write('Attack: '),write(S),nl,
		write('Defense: '),write(T),nl,nl,
		write('What will you do?'),asserta(isBattle).

statusEnemy(X):-	X=='goblin',
			asserta(enemyHP(200)),
			asserta(enemyAtk(100)),
			asserta(enemyDfs(60)),
			asserta(enemyExp(60)),!.
statusEnemy(X):-	X=='slime',
			asserta(enemyHP(100)),
			asserta(enemyAtk(60)),
			asserta(enemyDfs(40)),
			asserta(enemyExp(50)),!.
statusEnemy(X):-	X=='wolf',
			asserta(enemyHP(400)),
			asserta(enemyAtk(130)),
			asserta(enemyDfs(85)),
			asserta(enemyExp(70)),!.
statusEnemy(X):-	X=='boss',
			asserta(enemyHP(700)),
			asserta(enemyAtk(150)),
			asserta(enemyDfs(100)),
			asserta(enemyExp(100)),!.

enemyTurn(X):-	isBattle,
		X=:=4,getSpecialAttack,!.

enemyTurn(X):-	isBattle,
		X=\=4,
		defense(Y),
		enemyAtk(Z),!,
		S is round(Z-(0.8*Y)),getAttack(S),!.

cekDead(X):-	X=<0,!,
		enemyExp(Y),retract(isBattle),
		write('you earn '),
		write(Y),write(' exp'),
		upExp(Y).

cekDead(X):-	X>0,!,random(1,5,Y),
		enemyTurn(Y).

attack:-	isBattle,attack(X),
		enemyDfs(Y),
		enemyHP(Z),!,
		S is round(X-(0.8*Y)),
		T is Z-S,
		write('You deal '),write(S),write(' damage'),nl,
		asserta(enemyHP(T)),
		cekDead(T).

specialAttack:-	isBattle,attack(X),
		enemyDfs(Y),
		enemyHP(Z),!,
		S is round((X*2)-(0.8*Y)),
		T is Z-S,
		write('You deal '),write(S),write(' damage'),nl,
		asserta(enemyHP(T)),cekDead(T).

getAttack(S):-	S>0,
		health(X),
		T is X-S,
		write('Monster deal '),
		write(S),write(' damage'),
		asserta(health(T)),!.
getAttack(S):-	S=<0,write('Monster deal no damage '),nl,!.

getSpecialAttack:-	health(X),
			defense(Y),
			enemyAtk(Z),!,
			S is round((Z*2)-(0.8*Y)),
			T is X-S,
			write('Monster deal '),
			write(S),write(' damage'),
			asserta(health(T)).
	
canRun(X):-	X=:=3, write('you are lucky, you can run'),
		retract(isBattle),!.

canRun(X):-	X=\=3,write('you can\'t run'),nl,random(1,5,Y),
		enemyTurn(Y),!.

run:-		isBattle,random(1,5,X),
		canRun(X).