:-dynamic(enemyHP/1).
:-dynamic(enemyAtk/1).
:-dynamic(enemyDfs/1).
:-dynamic(enemyExp/1).
:-dynamic(isBattle/0).

:-dynamic(chance/1).
chance(1).
levelM(3).


found(X):-	levelM(Y),enemyHP(R),enemyAtk(S),enemyDfs(T),write('You found a '),write(X),nl,
			write('Level: '),write(Y),nl,
			write('Health: '),write(R),nl,
			write('Attack: '),write(S),nl,
			write('Defense: '),write(T),nl,nl,
			write('What will you do?'),asserta(isBattle),retract(isPlay).	

foundDungeon:-	levelM(Y),enemyHP(R),enemyAtk(S),enemyDfs(T),write('You found a dungeon'),nl,
				write('Level: '),write(Y),nl,
				write('Health: '),write(R),nl,
				write('Attack: '),write(S),nl,
				write('Defense: '),write(T),nl,nl,
				write('What will you do?'),asserta(isBattle),retract(isPlay).

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
				defense(Y),defInv(D),
				enemyAtk(Z),!,
				S is round(Z-(0.8*(Y+D))),getAttack(S),!.

cekDead(X):-	X=<0,!,
				enemyExp(Y),retract(isBattle),asserta(isPlay),
				write('You earn '),
				write(Y),write(' EXP'),
				upExp(Y),theMusuh(A),cekQuest(A),!.

cekDead(X):-	X>0,!,random(1,5,Y),
				enemyTurn(Y),!.

cekQuest(X):-	adaQuest,X=='slime',
				enemy(A,B,C),D is A+1,
				asserta(enemy(D,B,C)),isOver,!.
cekQuest(X):-	adaQuest,X=='goblin',
				enemy(A,B,C),D is B+1,
				asserta(enemy(A,D,C)),isOver,!.
cekQuest(X):-	adaQuest,X=='wolf',
				enemy(A,B,C),D is C+1,
				asserta(enemy(A,B,D)),isOver,!.


attack:-	isBattle,attack(X),attInv(A),
			enemyDfs(Y),
			enemyHP(Z),!,
			S is round((X+A)-(0.8*Y)),
			T is Z-S,nl,
			write('You deal '),write(S),write(' damage'),nl,
			asserta(enemyHP(T)),chance(C),D is C-1,asserta(chance(D)),
			cekDead(T),!.

specialAttack:-	isBattle,chance(X),doSpecialAttack(X),!.

doSpecialAttack(B):-	B=<1,attack(X),attInv(A),
						enemyDfs(Y),
						enemyHP(Z),!,
						S is round(((X+A)*2)-(0.8*Y)),
						T is Z-S,nl,
						write('You deal '),write(S),write(' damage'),nl,
						asserta(enemyHP(T)),asserta(chance(3)),cekDead(T),!.

doSpecialAttack(X):-	X>1,write('You can\'t use special attack'),nl,Y is X-1,
						asserta(chance(Y)),
						enemyHP(Z),cekDead(Z),!.

cekMati(X):-	X=<0,showDead,/*write('You are dead.'),*/nl,
				write('Would you like to play again?(y/n)'),nl,
				write('>'),read(I),cekInput(I).
cekMati(X):-	X>0,write(''),!.
cekInput(I):- I=='y',hapus,asserta(noStart),start,!.
cekInput(I):- I=='n',quit,!.



getAttack(S):-	S>0,
				health(X),
				T is X-S,
				write('Monster deal '),
				write(S),write(' damage'),
				asserta(health(T)),cekMati(T),!.
getAttack(S):-	S=<0,write('Monster deal no damage '),nl,!.

getSpecialAttack:-	health(X),
					defense(Y),defInv(D),
					enemyAtk(Z),!,
					S is round((Z*2)-(0.8*(Y+D))),
					T is X-S,
					write('Monster deal '),
					write(S),write(' damage'),
					asserta(health(T)),cekMati(T).
	
canRun(X):-	X=:=3, write('You are lucky, you can run.'),
			retract(isBattle),asserta(isPlay),!.

canRun(X):-	X=\=3,write('You can\'t run'),nl,random(1,5,Y),
			enemyTurn(Y),!.

run:-	isBattle,random(1,5,X),
		canRun(X).

showDead:-	nl,
			write('     *. ****.      ,*   ,o******o.     * ****      **           * *********o.       * **** *  **********   * *********o.          '),nl,
			write('      *. ****.    ,* . ****      **.   * ****      **           * ****     ^***.    * **** *  ****         * ****     ^***.       '),nl,
			write('       *. ****.  ,* ,* ****        *b  * ****      **           * ****         **.  * **** *  ****         * ****         **.     '),nl,
			write('       *. ****.,*   ** ****         *b * ****      **           * ****          **  * **** *  ****         * ****          **     '),nl,
			write('         *. *****   ** ****         ** * ****      **           * ****          **  * **** *  ************ * ****          **     '),nl,
			write('          *. ****   ** ****         ** * ****      **           * ****          **  * **** *  ****         * ****          **     '),nl,
			write('           * ****   ** ****        ,*P * ****      **           * ****         ,**  * **** *  ****         * ****         ,**     '),nl,
			write('           * ****    * ****       ,*P    ****     ,*P           * ****        ,**   * **** *  ****         * ****        ,**      '),nl,
			write('           * ****      ****     ,**      ****   ,d*P            * ****    ,o**P     * **** *  ****         * ****    ,o**P        '),nl,
			write('           * ****        *******P          Y*****P              * *********P        * **** *  ************ * *********P           '),nl,nl,nl,nl.