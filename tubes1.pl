loop(5):-write(*),nl,M is N-1.
start:-map(20,20).
loop(0).
loop(M).
map(X,Y):-kolom(Y),nl,X1 is X-1,map(X1,Y).
map(1,Y):-kolom(Y).
kolom(Y):-write(*),X1 is X-1,kolom(X1).
kolom(1):-write(*).
