moeda_diferente([X | L], Pos, valor).

% verificar tamanho da lista
tamL([_], 1):- !.
tamL([_|L], T):- tamL(L, X), T is X + 1, T == 12.

% 11 elementos iguais e 1 diferente
% se X é diferente da cabeça da sublista, então x é o diferente
% e o restante é igual 
% ou
% se x é igual a cabeça, verifica qual é o elemento diferente
% percorre o restante da sublista
eh_igual(_).
eh_diferente(_).

encontra_diferente(X, [H | L]):-
    X \== H,
    eh_diferente(X).
    
encontra_igual(X, [T | L]):-
    X == T,
	eh_igual(X).


% qual é o elemento diferente?
% O que sobrar da operação de cima é o elemento que é diferente
% Pertence a
% pertence_a(Item, Lista).
% pertence_a(4, [1, 2, 3, 4]).
pertence_a(X, [X | _]).

pertence_a(X, [_, Cauda]) :-
	pertence_a(X, Cauda).

% qual a posição do diferente?
% encontra o diferente e fala o indice
encontraind(E,[E|_],0):- !.
encontraind(E,[_|T],I):- pertence_a(E,T,X), I is X + 1.

% quais são os elementos iguais?

% verifica se o diferente é maior ou menor
% se X é igual há uma lista como pelo menos uma cabeça
% e uma sublista, se X não é igual a cabeça
% verifica na sublista
maior(X, [X | L], valor):- X > X, valor is maior.
maior(X, [H | L]):-
    maior(X, L).

menor(X, [X | L], valor):- X < X, valor is menor.
menor(X, [H | L]):-
    menor(X, L).

moeda_diferente([X | L], Pos, valor):-
    tamL([_|L], T),
    encontra_diferente([X | L]),
    encontra_igual([X | L]),
    encontraind(Pos, [X | L], Z):- Pos == Z,
    maior(X, [H | L], maior),
    menor(X, [H | L], menor).
