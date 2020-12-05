% EXERCICIO 1 - Elementos repetidos
% caso base, se for vazio o retorno é vazio
% se tem uma lista com Head e Tail, então
% filtra os elementos de acordo com o predicado
% pega os elementos que são repetidos e inseri na lista Z
elem_repetidos([],[]). 
elem_repetidos([X|Y], Result) :- 
   partition(=(X),Y,Es,Xs), 
  (Es=[] -> Result=Ys; Result=[X|Ys]),
   elem_repetidos(Xs,Ys).

%EXERCICIO 2 - Intercala A e B com C
intercalada(List, [], List):- 
    !.
intercalada([], List, List):- 
    !.
intercalada([Xs|A], [Ys|B], [Xs,Ys|C]):-
	intercalada(A, B, C).

% Exercicio 3 - inserção ordenada
insercao_ord(List1, List2, Result):-
    append([List1], List2, M),
    ordenada(M, Result). % utiliza a mesma função do exercicio 4, são semelhantes e pode ser utilizado para o mesmo proposito

% Exercicio 4 - ordena o item da lista 1 numa lista 2
reordena([],[],[]).
reordena([X1],[X1],[]).
reordena([X1,Y1|Z],[X1|A],[Y1|Xs]):- 
    reordena(Z,A,Xs). 

distribui_valores([],Xs,Xs).

distribui_valores(A,[],A).

distribui_valores([X|A],[Y|Xs],[X|C]):-
    X =< Y,
    distribui_valores(A,[Y|Xs],C).

distribui_valores([X|A],[Y|Xs],[Y|C]):-
    X > Y,
    distribui_valores([X|A],Xs,C).

ordenada([],[]).

ordenada([X],[X]).

ordenada([X,Y|Z],S):-
    reordena([X,Y|Z],A,B),
    ordenada(A,As),
    ordenada(B,Bs),
    distribui_valores(As,Bs,S).
