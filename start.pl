/*      MEMASUKI PERMAINAN      */
start   :- legenda,read(X),action(X).
/* LEGENDA */
legenda:-   corner(100),judulLegenda,legenda1,legenda2,legenda3,legenda4,legenda5,legenda6,legenda7,legenda8,legenda9,corner(100).
            
judulLegenda:-  write(*),
                tab(36),
                write('-- TIM AMBIS LUAR BIASA --'),
                tab(36),
                write(*),
                nl.
legenda1    :-  write(*),
                tab(2),
                write('1. start  : untuk memulai petualanganmu'),
                tab(57),
                write(*),
                nl.
legenda2    :-  write(*),
                tab(2),
                write('2. map    : menampilkan peta'),
                tab(68),
                write(*),
                nl.
legenda3    :-  write(*),
                tab(2),
                write('3. status : menampilkan kondisimu terkini'),
                tab(55),
                write(*),
                nl.
legenda4    :-  write(*),
                tab(2),
                write('4. w      : gerak ke utara 1 langkah'),
                tab(60),
                write(*),
                nl.
legenda5    :-  write(*),
                tab(2),
                write('5. s      : gerak ke selatan 1 langkah  '),
                tab(56),
                write(*),
                nl.
legenda6    :-  write(*),
                tab(2),
                write('6. d      : gerak ke ke timur 1 langkah'),
                tab(57),
                write(*),
                nl.
legenda7    :-  write(*),
                tab(2),
                write('7. a      : gerak ke barat 1 langkah'),
                tab(60),
                write(*),
                nl.
legenda8    :-  write(*),
                tab(2),
                write('8. Status : menampilkan status pemain'),
                tab(59),
                write(*),
                nl.
legenda9    :-  write(*),
                tab(2),
                write('8. help   : menampilkan segala bantuan'),
                tab(58),
                write(*),
                nl.
corner(X):- X>1,
            write(*),
            X1 is X-1, 
            corner(X1).
corner(1):- write(*),nl.

/*          PERINTAH MENURUT LEGENDA        */

/*  START   */
play    :-  write('Welcome to Genshin Asik. Choose your job'),nl,
            write('1. Swordsman'),nl,
            write('2. 2. Archer'),nl,
            write('3. Sorcerer').
map     :-  open('logkom.txt',read,Str),
            read(Str,House1),
            close(Str),
            write(House1).
action(X):- X=:=1,play.
action(X):- X=:=2,map. 
action(X):- X=:=3.
action(X):- X=:=4.
action(X):- X=:=5.
action(X):- X=:=6.
action(X):- X=:=7.
action(X):- X=:=8.


/*  MAP */