% Declare fact and rule as dynamic to allow modifications
:- dynamic fact/2.
:- dynamic rule/2.

% Define facts and rules
fact(has_fur, dog).
fact(has_tail, dog).
fact(has_fur, cat).
fact(has_tail, cat).
fact(has_feathers, bird).

rule(mammal, X) :-
    fact(has_fur, X),
    fact(has_tail, X).

rule(animals, X) :-
    fact(has_fur, X).

rule(animals, X) :-
    fact(has_feathers, X).

% Predicate to check if a goal can be entailed from the knowledge base
entails(Goal, _) :-
    fact(Goal, _).

entails(Goal, Derived) :-
    rule(Goal, X), % Match the rule
    \+ member(X, Derived), % Check if not already derived
    entails(X, [Goal | Derived]).

% Predicate to use backward chaining to prove a goal
prove(Goal, Entity) :-
    ( entails(Goal, [Entity]) ->
        write('Goal '), write(Goal), write(' for '), write(Entity), write(' cannotbe proved.'), nl
    ;
        write('Goal '), write(Goal), write(' for '), write(Entity), write('  is proved.'), nl
    ).

% Example queries
?- prove(mammal, dog).
?- prove(animals, dog).
?- prove(mammal, bird).
?- prove(animals, bird).
