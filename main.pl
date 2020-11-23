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

/**** INISIALISASI NILAI VARIABEL GLOBAL****/
exp(0).
attack(100).
defense(80).
level(1).
gold(1000).
health(1000).
batasHP(1000).