wow :-  random(1,10,X),thePrint(X).
thePrint(0).
thePrint(X) :-  X=\= 0,write(*),X1 is X-1,thePrint(X1).
