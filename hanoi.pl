% Move a single disk from Source peg to Destination peg
move_disk(1, Source, Destination, _) :-
    write('Move disk 1 from '), write(Source), write(' to '), write(Destination), nl.

% Move N disks from Source peg to Destination peg using Auxiliary peg
move_disk(N, Source, Destination, Auxiliary) :-
    N > 1,
    N1 is N - 1,
    % Move N-1 disks from Source to Auxiliary using Destination as a temporary peg
    move_disk(N1, Source, Auxiliary, Destination),
    % Move the Nth disk from Source to Destination
    write('Move disk '), write(N), write(' from '), write(Source), write(' to '), write(Destination), nl,
    % Move N-1 disks from Auxiliary to Destination using Source as a temporary peg
    move_disk(N1, Auxiliary, Destination, Source).

% Solve the Towers of Hanoi puzzle with N disks
towers_of_hanoi(N) :-
    move_disk(N, 'Source', 'Destination', 'Auxiliary').

% Example query:
% To solve the Towers of Hanoi with 3 disks, you would run the following query:
% ?- towers_of_hanoi(3).
