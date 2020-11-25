/**** IMPORT SEMUA FILE ****/
:- include('start.pl').
:- include('map.pl').
:- include('shop.pl').
:- include('updown.pl').

/**** MENDEFINISIKAN VARIABEL GLOBAL ****/
:-dynamic(isPlay/0).
:-dynamic(exp/1).
:-dynamic(level/1).
:-dynamic(gold/1).
:-dynamic(attack/1).
:-dynamic(defense/1).
:-dynamic(attInv/1).
:-dynamic(defInv/1).
:-dynamic(health/1).
:-dynamic(batasExp/1).
:-dynamic(batasHP/1).
:-dynamic(job/1).
:-dynamic(amount/1).
:-dynamic(noQuest/0).
:-dynamic(adaQuest/0).
:-dynamic(quest/3).
:-dynamic(enemy/3).

/**** INISIALISASI NILAI VARIABEL GLOBAL****/
exp(0).
attack(100).
defense(80).
attInv(0).
defInv(0).
level(1).
gold(1000).
health(1000).
batasHP(1000).
amount(6).
noQuest.
enemy(0,0,0).

getQuest:-	noQuest,retract(noQuest),nl,
			random(1,6,S), 
			random(1,6,G),
			random(1,6,W),asserta(quest(S,G,W)),
			write('You\'ve got a quest: '),nl,
			write('Beat '),write(S),write(' slime'),nl,
			write('Beat '),write(G),write(' goblin'),nl,
			write('Beat '),write(W),write(' wolf'),nl,
			asserta(adaQuest),w,!. 
getQuest:-	adaQuest,nl,
			write('You\'ve got your quest. Finish it before taking another one. '),nl,w,!.

quest:- isPlay,adaQuest,nl,write('Your quest: '),nl,nl,
		enemy(X,Y,Z),quest(S,G,W),
		write('Beat slime '),write(X),write('/'),write(S),nl,
		write('Beat goblin '),write(Y),write('/'),write(G),nl,
		write('Beat wolf '),write(Z),write('/'),write(W),nl,!.
quest:- isPlay,noQuest,nl,write('You have no quest.'),nl,!.

isOver:-	adaQuest,!,retract(adaQuest),asserta(noQuest),
			enemy(X,Y,Z),!,quest(S,G,W),!,X>=S,Y>=G,Z>=W,asserta(enemy(0,0,0)),
			nl,write('Well done!! Your quest is completed.'),nl,
			Exp is (20*S+30*G+40*W), Gold is (150*S+200*G+250*W),
			nl,write('Your reward: '),nl,
			write(Exp),write(' EXP + '),write(Gold),write(' Gold'),nl,
			upGold(Gold),upExp(Exp).
