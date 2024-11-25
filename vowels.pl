% Base case: an empty string has no vowels.
count_vowels([], 0).

% If the head of the list is a vowel, add 1 and check the tail.
count_vowels([H|T], Count) :-
    vowel(H),  % Check if the character is a vowel.
    count_vowels(T, RestCount),
    Count is RestCount + 1.

% If the head of the list is not a vowel, simply check the tail.
count_vowels([_|T], Count) :-
    count_vowels(T, Count).

% Predicate to check if a character is a vowel.
vowel('a').
vowel('e').
vowel('i').
vowel('o').
vowel('u').
vowel('A').
vowel('E').
vowel('I').
vowel('O').
vowel('U').

% Example query:
% Base case: an empty string has no vowels.
count_vowels([], 0).

% If the head of the list is a vowel, add 1 and check the tail.
count_vowels([H|T], Count) :-
    vowel(H),  % Check if the character is a vowel.
    count_vowels(T, RestCount),
    Count is RestCount + 1.

% If the head of the list is not a vowel, simply check the tail.
count_vowels([_|T], Count) :-
    count_vowels(T, Count).

% Predicate to check if a character is a vowel.
vowel('a').
vowel('e').
vowel('i').
vowel('o').
vowel('u').
vowel('A').
vowel('E').
vowel('I').
vowel('O').
vowel('U').

% Convert string to a list of characters and count vowels.
count_vowels_in_string(String, Count) :-
    atom_chars(String, CharList),  % Convert string to a list of characters.
    count_vowels(CharList, Count).  % Count vowels in the character list.
% Count = 3.
