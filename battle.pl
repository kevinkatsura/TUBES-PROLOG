:-dynamic(hpGoblin/1).
:-dynamic(hpSlime/1).
:-dynamic(hpWolf/1).
:-dynamic(enemyHP/1).
:-dynamic(enemyAtk/1).
:-dynamic(enemyDfs/1).
:-dynamic(enemyExp/1).
:-dynamic(enemyDead/0).
:-dynamic(isBattle/0).
levelM(3).
hpGoblin(200).
atkGoblin(100).
dfsGoblin(60).
hpSlime(100).
atkSlime(60).
dfsSlime(40).
hpWolf(400).
atkWolf(130).
dfsWolf(85).
hpBoss(700).
atkBoss(150).
dfsBoss(100).

enemyHP(200).
enemyAtk(100).
enemyDfs(60).
enemyExp(40).

found:-	asserta(isBattle).

enemyTurn(X):-	isBattle,
		X=:=4,getSpecialAttack,!.

enemyTurn(X):-	isBattle,
		X=\=4,getAttack,!.

cekDead:-	enemyHP(X),		
		X=<0,!,
		enemyExp(Y),retract(isBattle),
		write('you earn '),
		write(Y),write(' exp'),
		upExp(Y).

cekDead:-	enemyHP(X),		
		X>0,!,random(1,5,Y),
		enemyTurn(Y).

attack:-	isBattle,attack(X),
		enemyDfs(Y),
		enemyHP(Z),!,
		S is round(X-(0.8*Y)),
		T is Z-S,
		write('You deal '),write(S),write(' damage'),nl,
		asserta(enemyHP(T)),
		cekDead.

specialAttack:-	isBattle,attack(X),
		enemyDfs(Y),
		enemyHP(Z),!,
		S is round((X*2)-(0.8*Y)),
		T is Z-S,
		write('You deal '),write(S),write(' damage'),nl,
		asserta(enemyHP(T)),cekDead.

getAttack:-	health(X),
		defense(Y),
		enemyAtk(Z),!,
		S is round(Z-(0.8*Y)),
		T is X-S,
		write('Monster deal '),
		write(S),write(' damage'),
		asserta(health(T)).

getSpecialAttack:-	health(X),
			defense(Y),
			enemyAtk(Z),!,
			S is round((Z*2)-(0.8*Y)),
			T is X-S,
			write('Monster deal '),
			write(S),write(' damage'),
			asserta(health(T)).
	

run:-		isBattle,random(1,3,X),
		X=:=1, write('you are lucky, you can run'),
		retract(isBattle).
run:-		isBattle,random(1,3,X),
		X=:=2,write("you can't run"),
		enemyTurn.
