% Facts about family relationships
parent(john, mike).
parent(john, sara).
parent(mike, anna).
parent(mike, david).
parent(sara, emma).

% Rules for relationships
father(Father, Child) :- parent(Father, Child), male(Father).
mother(Mother, Child) :- parent(Mother, Child), female(Mother).
child(Child, Parent) :- parent(Parent, Child).
sibling(Sibling1, Sibling2) :- parent(Parent, Sibling1), parent(Parent, Sibling2), Sibling1 \= Sibling2.
brother(Brother, Person) :- sibling(Brother, Person), male(Brother).
sister(Sister, Person) :- sibling(Sister, Person), female(Sister).

% Example queries
?- father(john, Child).
Child = mike.

?- mother(sara, Child).
Child = emma.

?- child(david, Parent).
Parent = mike.

?- sibling(anna, Sibling).
Sibling = david ;
Sibling = anna.

?- brother(Brother, emma).
Brother = david.

?- sister(Sister, mike).
Sister = sara.
