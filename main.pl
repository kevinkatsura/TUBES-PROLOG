/**** IMPORT SEMUA FILE ****/
:- include('start.pl').
:- include('map.pl').
:- include('shop.pl').
:- include('updown.pl').

/**** MENDEFINISIKAN VARIABEL GLOBAL ****/
:-dynamic(isStart/0).
:-dynamic(isPlay/0).
:-dynamic(exp/1).
:-dynamic(level/1).
:-dynamic(gold/1).
:-dynamic(attack/1).
:-dynamic(defense/1).
:-dynamic(health/1).
:-dynamic(batasExp/1).
:-dynamic(batasHP/1).
:-dynamic(job/1).
:-dynamic(amount/1).
:-dynamic(quest1/0).
:-dynamic(quest2/0).
:-dynamic(quest3/0).
:-dynamic(quest4/0).
:-dynamic(slime/1).
:-dynamic(goblin/1).
:-dynamic(wolf/1).

/**** INISIALISASI NILAI VARIABEL GLOBAL****/
exp(0).
attack(100).
defense(80).
level(1).
gold(1000).
health(1000).
batasHP(1000).
amount(6).
quest1.
slime(0).
goblin(0).
wolf(0).

quest:- quest1,nl,write('Your first quest: '),nl,nl,
		write('Beat slime '),slime(X),write(X),write('/5'),nl,
		write('Beat goblin '),goblin(Y),write(Y),write('/3'),nl,
		write('Beat wolf '),wolf(Z),write(Z),write('/1'),nl,!.
quest:- quest2,nl,write('Your second quest: '),nl,nl,
		write('Beat slime '),slime(X),write(X),write('/8'),nl,
		write('Beat goblin '),goblin(Y),write(Y),write('/5'),nl,
		write('Beat wolf '),wolf(Z),write(Z),write('/3'),nl,!.
quest:- quest3,nl,write('Your third quest: '),nl,nl,
		write('Beat slime '),slime(X),write(X),write('/10'),nl,
		write('Beat goblin '),goblin(Y),write(Y),write('/8'),nl,
		write('Beat wolf '),wolf(Z),write(Z),write('/5'),nl,!.
quest:- quest4,nl,write('Your fourth quest: '),nl,nl,
		write('Beat slime '),slime(X),write(X),write('/15'),nl,
		write('Beat goblin '),goblin(Y),write(Y),write('/10'),nl,
		write('Beat wolf '),wolf(Z),write(Z),write('/8'),nl,!.
quest:- nl,write('You have no quest.'),nl.
