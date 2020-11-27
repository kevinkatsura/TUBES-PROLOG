/*=======================|== SAVE & LOAD GAME ==|=======================*/


save_game(Filename):-
	/* Function to save file */
	
	open(Filename, write, Stream),

	/* Gathering data */
	
	/*Player Data*/
	health(Health),
	gold(Gold),
	exp(Exp),
	level(Level),
	attack(Attack),
	defense(Defense),
	attInv(AttInv),
	defInv(DefInv),
	job(Job),
	amount(Amount),
	batasHP(BatasHP),
	enemy(X,Y,Z),

	/*Map Data*/
	panjangMap(PanjangMap),
	lebarMap(LebarMap),
	musuh(Nama,Pos),
	banyakMusuh(BanyakMusuh),
	questPosition(QuestPosition),
	dungeonPosition(DungeonPosition),
	playerPosition(PlayerPosition),


	/* Write player data */
	write(Stream, Health), 			write(Stream, '.'), nl(Stream),
	write(Stream, Gold), 			write(Stream, '.'), nl(Stream),
	write(Stream, Exp), 			write(Stream, '.'), nl(Stream),
	write(Stream, Level), 			write(Stream, '.'), nl(Stream),
	write(Stream, Attack), 			write(Stream, '.'), nl(Stream),
	write(Stream, Defense), 		write(Stream, '.'), nl(Stream),
	write(Stream, AttInv), 			write(Stream, '.'), nl(Stream),
	write(Stream, DefInv), 			write(Stream, '.'), nl(Stream),
	write(Stream, Job), 			write(Stream, '.'), nl(Stream),
	write(Stream, Amount), 			write(Stream, '.'), nl(Stream),
	write(Stream, BatasHP), 		write(Stream, '.'), nl(Stream),
	write(Stream, X), 			write(Stream, '.'), nl(Stream),
	write(Stream, Y), 			write(Stream, '.'), nl(Stream),
	write(Stream, Z),	 		write(Stream, '.'), nl(Stream),
	
	/*Write Map Data*/
	write(Stream, PanjangMap),		write(Stream, '.'), nl(Stream),
	write(Stream, LebarMap),		write(Stream, '.'), nl(Stream),
	write(Stream, Nama),			write(Stream, '.'), nl(Stream),
	write(Stream, Pos),			write(Stream, '.'), nl(Stream),
	write(Stream, BanyakMusuh),		write(Stream, '.'), nl(Stream),
	write(Stream, QuestPosition),		write(Stream, '.'), nl(Stream),
	write(Stream, DungeonPosition),		write(Stream, '.'), nl(Stream),
	write(Stream, PlayerPosition),		write(Stream, '.'), nl(Stream),


	write('Save data successfully created !'), nl,
	close(Stream).



load_game(Filename):-
	/* Function to load file */
	
	open(Filename, read, Stream),
	
	/*Player Data*/
	health(Health),
	gold(Gold),
	exp(Exp),
	level(Level),
	attack(Attack),
	defense(Defense),
	attInv(AttInv),
	defInv(DefInv),
	job(Job),
	amount(Amount),
	batasHP(BatasHP),
	enemy(X,Y,Z),

	retract(health(Health)),
	retract(gold(Gold)),
	retract(exp(Exp)),
	retract(level(Level)),
	retract(attack(Attack)),
	retract(defense(Defense)),
	retract(attInv(AttInv)),
	retract(defInv(DefInv)),
	retract(job(Job)),
	retract(amount(Amount)),
	retract(batasHP(BatasHP)),
	retract(enemy(X,Y,Z)),
	

	/*Read player data*/
	read(Stream, New_Health),
	read(Stream, New_Gold),
	read(Stream, New_Exp),
	read(Stream, New_Level),
	read(Stream, New_Attack),
	read(Stream, New_Defense),
	read(Stream, New_AttInv),
	read(Stream, New_DefInv),
	read(Stream, New_Job),
	read(Stream, New_Amount),
	read(Stream, New_BatasHP),
	read(Stream, New_X),
	read(Stream, New_Y),
	read(Stream, New_Z),

	asserta(health(New_Health)),
	asserta(gold(New_Gold)),
	asserta(exp(New_Exp)),
	asserta(level(New_Level)),
	asserta(attack(New_Attack)),
	asserta(defense(New_Defense)),
	asserta(attInv(New_AttInv)),
	asserta(defInv(New_DefInv)),
	asserta(job(New_Job)),
	asserta(amount(New_Amount)),
	asserta(batasHP(New_BatasHP)),
	asserta(enemy(New_X,New_Y,New_Z)),


	/*Map Data*/
	panjangMap(PanjangMap),
	lebarMap(LebarMap),
	musuh(Nama,Pos),
	banyakMusuh(BanyakMusuh),
	questPosition(QuestPosition),
	dungeonPosition(DungeonPosition),
	playerPosition(PlayerPosition),

	retract(panjangMap(PanjangMap)),
	retract(lebarMap(LebarMap)),
	retract(musuh(Nama,Pos)),
	retract(banyakMusuh(BanyakMusuh)),
	retract(questPosition(QuestPosition)),
	retract(dungeonPosition(DungeonPosition)),
	retract(playerPosition(PlayerPosition)),

	/*Read map data*/ 
	read(Stream, New_PanjangMap),
	read(Stream, New_LebarMap),
	read(Stream, New_Nama),
	read(Stream, New_Pos),
	read(Stream, New_BanyakMusuh),
	read(Stream, New_QuestPosition),
	read(Stream, New_DungeonPosition),
	read(Stream, New_PlayerPosition),

	asserta(panjangMap(New_PanjangMap)),
	asserta(lebarMap(New_LebarMap)),
	asserta(musuh(New_Nama,New_Pos)),
	asserta(banyakMusuh(New_BanyakMusuh)),
	asserta(questPosition(New_QuestPosition)),
	asserta(dungeonPosition(New_DungeonPosition)),
	asserta(playerPosition(New_PlayerPosition)),


	write('Data successfully loaded !'), nl,
	close(Stream).