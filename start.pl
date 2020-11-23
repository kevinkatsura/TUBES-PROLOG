:-dynamic(job/1).

/*************************** MEMASUKI PERMAINAN ***************************/
start   :-  write('   ____  U _____ u _   _    ____     _   _               _   _ '),nl,
            write('U /"___|u | ___"|/| \\ |"|  / __"| u | | | |     ___     | \\ |"|  '),nl,
            write('\\| |  _ / |  _|" <|  \\| |><\\___ \\/ /| |_| |\\   |_"_|   <|  \\| |>   '),nl,
            write(' | |_| |  | |___ U| |\\  |u u___) | U|  _  |u    | |    U| |\\  |u  '),nl,
            write('  \\____|  |_____| |_| \\_|  |____/>> |_| |_|   U/| |\\u   |_| \\_|    '),nl,
            write('  _)(|_   <<   >> ||   \\,-.)(  (__)//   \\.-,_|___|_,-.||   \\,-. '),nl,
            write('(__)__) (__) (__)(_")  (_/(__)    (_") ("_)\\_)-\' \'-(_/ (_")  (_/  '),nl,nl,
            write('Good isekai game!!'),nl,nl,
            write('Let\'s play and be a programmer'),nl,nl,
            legenda.

/* LEGENDA */
legenda:- corner(100),judulLegenda,legenda1,legenda2,legenda3,legenda4,legenda5,legenda6,legenda7,legenda8,legenda9,corner(100).
            
judulLegenda:-  write('%'),
                tab(36),
                write('-- TIM AMBIS LUAR BIASA --'),
                tab(36),
                write('%'),
                nl.
legenda1    :-  write('%'),
                tab(2),
                write('1. play   : untuk memulai petualanganmu'),
                tab(57),
                write('%'),
                nl.
legenda2    :-  write('%'),
                tab(2),
                write('2. map    : menampilkan peta'),
                tab(68),
                write('%'),
                nl.
legenda3    :-  write('%'),
                tab(2),
                write('3. status : menampilkan kondisimu terkini'),
                tab(55),
                write('%'),
                nl.
legenda4    :-  write('%'),
                tab(2),
                write('4. w      : gerak ke utara 1 langkah'),
                tab(60),
                write('%'),
                nl.
legenda5    :-  write('%'),
                tab(2),
                write('5. s      : gerak ke selatan 1 langkah  '),
                tab(56),
                write('%'),
                nl.
legenda6    :-  write('%'),
                tab(2),
                write('6. d      : gerak ke ke timur 1 langkah'),
                tab(57),
                write('%'),
                nl.
legenda7    :-  write('%'),
                tab(2),
                write('7. a      : gerak ke barat 1 langkah'),
                tab(60),
                write('%'),
                nl.
legenda8    :-  write('%'),
                tab(2),
                write('8. Status : menampilkan status pemain'),
                tab(59),
                write('%'),
                nl.
legenda9    :-  write('%'),
                tab(2),
                write('8. help   : menampilkan segala bantuan'),
                tab(58),
                write('%'),
                nl.
corner(X):- X>1,
            write('%'),
            X1 is X-1, 
            corner(X1).
corner(1):- write('%'),nl.

/*          PERINTAH MENURUT LEGENDA        */

/* PLAY GAME */ 
play   :-   write('Welcome to Genshin Asik. Choose your job'),nl,
            write('1. Swordsman'),nl,
            write('2. Archer'),nl,
            write('3. Sorcerer'),nl,
            write('>'),read(X),nl,Y is X,playuser(Y).

/* Menampilkan output sesuai input user */
playuser(X) :-  X=:=1, write('You choose swordsman, let\'s explore the world'),nl,
                asserta(job('swordsman')). 
playuser(X) :-  X=:=2, write('You choose archer, let\'s explore the world'),nl,
                asserta(job('archer')).
playuser(X) :- X=:=3, write('You choose sorcerer, let\'s explore the world'),nl,
                asserta(job('sorcerer')). 

/* HELP */
help :- nl,write('Need help? Read instructions below: '),nl,nl,
        legenda.