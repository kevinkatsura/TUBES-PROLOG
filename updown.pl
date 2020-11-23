/************************************ UPGRADE DAN DOWNGRADE ***********************************/ 

:-dynamic(exp/1).
:-dynamic(level/1).
:-dynamic(gold/1).
:-dynamic(attack/1).
:-dynamic(defense/1).
:-dynamic(health/1).
:-dynamic(batasExp/1).
job(swordsman).
exp(0).
attack(100).
defense(80).
level(1).
gold(1000).

maxExp:-	job(swordsman),
		level(4),!,
		asserta(batasExp(750)).
maxExp:-	job(swordsman),
		level(3),!,
		asserta(batasExp(600)).
maxExp:-	job(swordsman),
		level(2),!,
		asserta(batasExp(450)).
maxExp:-	job(swordsman),
		level(1),!,
		asserta(batasExp(300)).


maxExp:-	job(archer),
		level(4),!,
		asserta(batasExp(600)).
maxExp:-	job(archer),
		level(3),!,
		asserta(batasExp(500)).
maxExp:-	job(archer),
		level(2),!,
		asserta(batasExp(400)).
maxExp:-	job(archer),
		level(1),!,
		asserta(batasExp(250)).

maxExp:-	job(sorcerer),
		level(4),!,
		asserta(batasExp(650)).
maxExp:-	job(sorcerer),
		level(3),!,
		asserta(batasExp(500)).
maxExp:-	job(sorcerer),
		level(2),!,
		asserta(batasExp(350)).
maxExp:-	job(sorcerer),
		level(1),!,
		asserta(batasExp(250)).

naikLevel:-	exp(Y1),!,
		maxExp,
		batasExp(S),!,
		Y1>=S,
		Y2 is Y1-S,
		level(Z),
		Z1 is Z+1,
		asserta(level(Z1)),
		asserta(exp(Y2)).


upExp(X):-	exp(Y),!,
		Y1 is Y+X,
		asserta(exp(Y1)),
		naikLevel.


upGold(X):-	gold(Y),
		Y1 is Y+X,
		asserta(gold(Y1)).
upAttack(X):-	attack(Y),
		Y1 is Y+X,
		asserta(attack(Y1)).
upDefense(X):-	defense(Y),
		Y1 is Y+X,
		asserta(defense(Y1)).
upHealth(X):-	health(Y),
		Y1 is Y+X,
		asserta(health(Y1)).
downHealth(X):-	health(Y),
		Y1 is Y-X,
		Y1>0,
		asserta(health(Y1)).



			