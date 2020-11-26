/************************************ UPGRADE DAN DOWNGRADE ***********************************/ 

/* Mendefinisikan status awal pemain untuk tiap job dan level */
maxExp:-	job(swordsman),
		level(5),!,
		asserta(batasExp(99999)),
		asserta(batasHP(1600)),
		asserta(attack(175)),
		asserta(defense(100)).
maxExp:-	job(swordsman),
		level(4),!,
		asserta(batasExp(750)),
		asserta(batasHP(1500)),
		asserta(attack(165)),
		asserta(defense(95)).
maxExp:-	job(swordsman),
		level(3),!,
		asserta(batasExp(600)),
		asserta(batasHP(1350)),
		asserta(attack(150)),
		asserta(defense(90)).
maxExp:-	job(swordsman),
		level(2),!,
		asserta(batasExp(450)),
		asserta(batasHP(1200)),
		asserta(attack(130)),
		asserta(defense(80)).
maxExp:-	job(swordsman),
		level(1),!,
		asserta(batasExp(300)),
		asserta(batasHP(1000)),
		asserta(attack(100)),
		asserta(defense(70)).

maxExp:-	job(archer),
		level(5),!,
		asserta(batasExp(99999)),
		asserta(batasHP(1450)),
		asserta(attack(170)),
		asserta(defense(90)).
maxExp:-	job(archer),
		level(4),!,
		asserta(batasExp(600)),
		asserta(batasHP(1300)),
		asserta(attack(140)),
		asserta(defense(80)).
maxExp:-	job(archer),
		level(3),!,
		asserta(batasExp(500)),
		asserta(batasHP(1250)),
		asserta(attack(118)),
		asserta(defense(80)).
maxExp:-	job(archer),
		level(2),!,
		asserta(batasExp(400)),
		asserta(batasHP(1100)),
		asserta(attack(95)),
		asserta(defense(70)).
maxExp:-	job(archer),
		level(1),!,
		asserta(batasExp(250)),
		asserta(batasHP(1000)),
		asserta(attack(80)),
		asserta(defense(70)).

maxExp:-	job(sorcerer),
		level(5),!,
		asserta(batasExp(99999)),
		asserta(batasHP(1450)),
		asserta(attack(185)),
		asserta(defense(80)).
maxExp:-	job(sorcerer),
		level(4),!,
		asserta(batasExp(650)),
		asserta(batasHP(1300)),
		asserta(attack(145)),
		asserta(defense(70)).
maxExp:-	job(sorcerer),
		level(3),!,
		asserta(batasExp(500)),
		asserta(batasHP(1200)),
		asserta(attack(110)),
		asserta(defense(60)).
maxExp:-	job(sorcerer),
		level(2),!,
		asserta(batasExp(350)),
		asserta(batasHP(1100)),
		asserta(attack(85)),
		asserta(defense(55)).
maxExp:-	job(sorcerer),
		level(1),!,
		asserta(batasExp(250)),
		asserta(batasHP(1000)),
		asserta(attack(70)),
		asserta(defense(50)).

/* Menaikkan level pemain */
naikLevel:-	exp(Y1),!,
		maxExp,
		batasExp(S),!,
		Y1>=S,
		Y2 is Y1-S,
		level(Z),
		Z1 is Z+1,
		asserta(level(Z1)),
		maxExp,
		batasHP(R),
		asserta(exp(Y2)),
		asserta(health(R)).

/* Menaikkan exp pemain sebesar parameter X */
upExp(X):-	exp(Y),!,
		Y1 is Y+X,
		asserta(exp(Y1)),
		naikLevel.

/* Menaikkan uang pemain sebesar parameter X */
upGold(X):-	gold(Y),
			Y1 is Y+X,
			asserta(gold(Y1)).
upAttack(X):-	attack(Y),
				Y1 is Y+X,
				asserta(attack(Y1)).
upAttInv(X):-	attInv(Y),
				Y1 is Y+X,
				asserta(attInv(Y1)).
upDefense(X):-	defense(Y),
				Y1 is Y+X,
				asserta(defense(Y1)).
upDefInv(X):-	defInv(Y),
				Y1 is Y+X,
				asserta(defInv(Y1)).
upHealth(X):-	health(Y),
				Y1 is Y+X,
				asserta(health(Y1)).
downHealth(X):-	health(Y),
		Y1 is Y-X,
		Y1>0,
		asserta(health(Y1)).

/* Menampilkan status pemain ke layar */
status:-isPlay,nl,write('Your Status: '),nl,nl,
		maxExp,
		job(Q),
		level(S),
		health(T),
		attack(U),
		defense(V),
		exp(W),
		gold(X),
		batasHP(Z),
		batasExp(Y),
		write('Job: '),
		write(Q),nl,
		write('Level: '),
		write(S),nl,
		write('Health: '),
		write(T),write('/'),write(Z),nl,
		write('Attack: '),
		write(U),nl,
		write('Defense: '),
		write(V),nl,
		write('Exp: '),
		write(W),write('/'),write(Y),nl,
		write('Gold: '), write(X),nl. 
		

			