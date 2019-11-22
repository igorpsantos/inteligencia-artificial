moeda_diferente([2,2,2,2,3,2,2,2,2,2,2,2]).

% verificar tamanho da lista
tamL([_], 1):- !.
tamL([_|L], T):- tamL(L, X), T is X + 1.

% 11 elementos iguais e 1 diferente
retirar_todas(_,[],[]).
retirar_todas(Elem,[Elem|Cauda], L):-
    retirar_todas(Elem, Cauda, L).
retirar_todas(Elem, [Elem1|Cauda],[Elem1|Cauda1]):-
    Elem \== Elem1,
    retirar_todas(Elem, Cauda, Cauda1).

retirar_rep([],[]).
retirar_rep([Elem|Cauda], [Elem|Cauda1]):-
    retirar_todas(Elem,Cauda,Lista),
    retirar_rep(Lista,Cauda1).


% qual é o elemento diferente?
% O que sobrar da operação de cima é o elemento que é diferente
% Pertence a
% pertence_a(Item, Lista).
% pertence_a(4, [1, 2, 3, 4]).
pertence_a(X, [X | _]).

pertence_a(X, [_, Cauda]) :-
	pertence_a(X, Cauda).

% qual a posição do diferente?
encontraind(E,[E|_],0):- !.
encontraind(E,[_|T],I):- pertence_a(E,T,X), I is X + 1.

% quais são os elementos iguais?
% verifica se o diferente é maior ou menor