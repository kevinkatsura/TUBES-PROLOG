:-dynamic(isStart/0).
:-dynamic(noStart/0).
:-dynamic(noPlay/0).
noStart.
noPlay.

/*************************** MEMASUKI PERMAINAN ***************************/
start   :-  noStart,!,retract(noStart),nl,
            write('   ____  U _____ u _   _    ____     _   _               _   _ '),nl,
            write('U /"___|u | ___"|/| \\ |"|  / __"| u | | | |     ___     | \\ |"|  '),nl,
            write('\\| |  _ / |  _|" <|  \\| |><\\___ \\/ /| |_| |\\   |_"_|   <|  \\| |>   '),nl,
            write(' | |_| |  | |___ U| |\\  |u u___) | U|  _  |u    | |    U| |\\  |u  '),nl,
            write('  \\____|  |_____| |_| \\_|  |____/>> |_| |_|   U/| |\\u   |_| \\_|    '),nl,
            write('  _)(|_   <<   >> ||   \\,-.)(  (__)//   \\.-,_|___|_,-.||   \\,-. '),nl,
            write('(__)__) (__) (__)(_")  (_/(__)    (_") ("_)\\_)-\' \'-(_/ (_")  (_/  '),nl,nl,
            write('Good isekai game!!'),nl,nl,
            write('Let\'s play and be a programmer'),nl,nl,asserta(isStart),
            legenda.

/* LEGENDA */
legenda:- corner(100),judulLegenda,legenda1,legenda2,legenda3,legenda4,legenda5,legenda6,legenda7,legenda8,corner(100).
            
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
play   :-   isStart,!,noPlay,!,
            retract(noPlay), asserta(isPlay),
            mapAwal,nl,
            write('Welcome to Genshin Asik. Choose your job'),nl,
            write('1. Swordsman'),nl,
            write('2. Archer'),nl,
            write('3. Sorcerer'),nl,
            write('>'),read(X),nl,Y is X,playuser(Y).

/* Menampilkan output sesuai input user */
playuser(X) :-  X=:=1, write('You choose swordsman, let\'s explore the world'),nl,
		asserta(job('swordsman')),!.
		/*write('Continue the previous game?'),nl,
		write('1. continue'),nl,
		write('2. new game'),nl,
		write('**==new game will delete the previous game==**'),nl,
		write('>'),read(A),nl,Y is A,check1(Y).*/
playuser(X) :-  X=:=2, write('You choose archer, let\'s explore the world'),nl,
                asserta(job('archer')),!,
		write('Continue the previous game?'),nl,
		write('1. continue'),nl,
		write('2. new game'),nl,
		write('**==new game will delete the previous game==**'),nl,
		write('>'),read(A),nl,Y is A,check2(Y).
playuser(X) :-  X=:=3, write('You choose sorcerer, let\'s explore the world'),nl,
                asserta(job('sorcerer')),!,
		write('Continue the previous game?'),nl,
		write('1. continue'),nl,
		write('2. new game'),nl,
		write('**==new game will delete the previous game==**'),nl,
		write('>'),read(A),nl,Y is A,check3(Y). 

check1(X):-      X=:=1,load_game('data1continue.txt'),status,!.
check1(X):-      X=:=2,load_game('data1newgame.txt'),status,!.
check2(X):-      X=:=1,load_game('data2continue.txt'),status,!.
check2(X):-      X=:=2,load_game('data2newgame.txt'),status,!.
check3(X):-      X=:=1,load_game('data3continue.txt'),status,!.
check3(X):-      X=:=2,load_game('data3newgame.txt'),status,!.

/* HELP */
helpPlayGuide   :-  write('%'),
                    tab(42),
                    write('-- PLAY GUIDE --'),
                    tab(42),
                    write('%'),
                    nl. 
                    
headOfHelp1     :-      tab(6),write('%                                                                                                                                                                                 %').
headOfHelp2     :-      tab(6),write('%                                                                                -- SURSURUPRISE --                                                                               %').
help1   :-              tab(6),write('% 7.  shop              : untuk masuk ke shop, anda harus memanggil \'shop.\' ketika telah berada pada posisi shop.                                                               %').
help2   :-              tab(6),write('% 8.  exitShop          : gunakan perintah \'exitShop.\' untuk keluar dari shop. Setiap selesai dari shop wajib memanggil perintah ini.                                           %').
help3   :-              tab(6),write('% 9.  teleportM         : gunakan perintah \'teleportM.\' untuk berpindah Map.                                                                                                    %').
help4   :-              tab(6),write('% 10. teleportP         : gunakan perintah \'teleportP.\' untuk berpindah tempat pada Map yang sama.                                                                              %').
help5   :-              tab(6),write('% 11. teleportS         : gunakan perintah \'teleportS.\' untuk langsung mengunjungi shop.                                                                                        %').
help6   :-              tab(6),write('% 12. teleportQ         : gunakan perintah \'teleportQ.\' untuk langsung mengunjungi Quest dan langsung mendapatkan Quest.                                                        %').
help7   :-              tab(6),write('% 13. teleportD         : gunakan perintah \'teleportD.\' untuk langsung mengunjungi Dungeon Boss.                                                                                %').
help8   :-              tab(6),write('% 14. attack/run        : ketika menemui attack/run, ketik \'attack.\' untuk menyerang musuh atau \'run.\' untuk menghindari musuh.                                               %').
help9   :-              tab(6),write('% 15. specialAttack     : ketika dalam battle, gunakan perintah \'specialAttack.\' untuk memberikan Attack Spesial pada musuh yg hanya dapat digunakan 1 kali dalam 3 battlefield.%').
help10  :-              tab(6),write('% 16. gacha             : gunakan perintah\'gacha.\' ketika berada di shop untuk membeli Gacha.                                                                                   %').
help11  :-              tab(6),write('% 17. potion            : gunakan perintah \'potion.\' ketika berada di shop untuk membeli Health Potion.                                                                         %').
help12  :-              tab(6),write('% 18. vision            : gunakan perintah \'vision.\' ketika berada di shop untuk membeli Magic Vision.                                                                          %').
help13  :-              tab(6),write('% 19. inventory         : gunakan perintah \'inventory.\' untuk menampilkan isi inventory kamu.                                                                                   %').
help14  :-              tab(6),write('% 20. usePotion         : gunakan perintah \'usePotion.\' untuk menggunakan Health Potion jika tersedia.                                                                          %').
help15  :-              tab(6),write('% 21. seeEnemy          : gunakan perintah \'seeEnemy.\' untuk melihat Enemy pada map jika memiliki Magic Vision.                                                                 %').
help16  :-              tab(6),write('% 22. HolyPotion        : gunakan perintah \'HolyPotion.\' ketika berada di shop untuk membeli Holy Potion.                                                                       %').
help17  :-              tab(6),write('% 23. useHolyPotion     : gunakan perintah \'useHolyPotion.\' untuk menggunakan Holy Potion jika tersedia.                                                                        %').
help18  :-              tab(6),write('% 1.  map               : menampilkan peta.                                                                                                                                       %').
help19  :-              tab(6),write('% 2.  status            : menampilkan kondisimu terkini.                                                                                                                          %').
help20  :-              tab(6),write('% 3.  w                 : gerak ke utara 1 langkah.                                                                                                                               %').
help21  :-              tab(6),write('% 4.  s                 : gerak ke selatan 1 langkah.                                                                                                                             %').
help22  :-              tab(6),write('% 5.  d                 : gerak ke ke timur 1 langkah.                                                                                                                            %').
help23  :-              tab(6),write('% 6.  a                 : gerak ke barat 1 langkah.                                                                                                                               %').



helpTambahan    :-  corner(189),
                    headOfHelp1,nl,
                    headOfHelp2,nl,
                    headOfHelp1,nl,
                    help18,nl,
                    help19,nl,
                    help20,nl,
                    help21,nl,
                    help22,nl,
                    help23,nl,
                    help1,nl,
                    help2,nl,
                    help3,nl,
                    help4,nl,
                    help5,nl,
                    help6,nl,
                    help7,nl,
                    help8,nl,
                    help9,nl,
                    help10,nl,
                    help11,nl,
                    help12,nl,
                    help13,nl,
                    help14,nl,
                    help15,nl,
                    help16,nl,
                    help17,nl,
                    headOfHelp1,nl,
                    corner(189),nl.
help:-  nl,write('Need a help? Read instructions below: '),nl,nl,
        helpTambahan,nl,nl.

save_game:- job('swordsman'),save_game('data1continue.txt').
save_game:- job('archer'),save_game('data2continue.txt').
save_game:- job('sorcerer'),save_game('data3continue.txt').


quit:- 	nl,save_game,nl,
	write(' >>> Thank you for playing, see you!! ^_^ '),nl,sleep(1),
        write(' >>> Program will close in ....'),sleep(1),nl, write(' >>> 3 '),sleep(1),nl,write(' >>> 2, '),sleep(1),nl,write(' >>> 1.'),
        halt.

