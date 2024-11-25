% Declare fact as dynamic to allow runtime modifications
:- dynamic fact/2.

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

% Derived facts
:- dynamic derived/1.
derived([]).

% Implement forward chaining
forward_chaining :-
    repeat,
    (
        derived(Derived),
        rule(Consequent, X),
        \+ member(Consequent-X, Derived), % Check if already derived
        \+ fact(Consequent, X), % Check if not already known as a fact
        (
            check_conditions(X) ->
            write('Derived: '), write(Consequent), write(' for '), write(X), nl,
            asserta(fact(Consequent, X)),
            append([Consequent-X], Derived, NewDerived),
            retract(derived(Derived)),
            asserta(derived(NewDerived))
        ;
            true
        )
    ),
    % Exit if no new facts are derived
    \+ (
        derived(Derived),
        rule(Consequent, X),
        \+ member(Consequent-X, Derived),
        \+ fact(Consequent, X)
    ),
    !. % Cut to terminate repeat loop

% Check if all conditions of a rule are satisfied
check_conditions(X) :-
    rule(_, X),
    fact(_, X).
