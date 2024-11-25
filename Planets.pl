% Database of planets with names, types, and distances from the Sun (in Astronomical Units, AU)
planet(mercury, rocky, 0.39).
planet(venus, rocky, 0.72).
planet(earth, rocky, 1.00).
planet(mars, rocky, 1.52).
planet(jupiter, gas_giant, 5.20).
planet(saturn, gas_giant, 9.58).
planet(uranus, gas_giant, 19.22).
planet(neptune, gas_giant, 30.05).

% Predicate to query planets of a specific type
% Example: planets_of_type(rocky, RockyPlanets) -> Returns all rocky planets
planets_of_type(Type, Planets) :-
    findall(Name, planet(Name, Type, _), Planets).

% Predicate to query planets within a specific distance range from the Sun
% Example: planets_within_distance(5, 20, Planets) -> Returns planets within 5 to 20 AU from the Sun
planets_within_distance(Min, Max, Planets) :-
    findall(Name, (planet(Name, _, Distance), Distance >= Min, Distance =< Max), Planets).

% Example queries
% To find all rocky planets:
% ?- planets_of_type(rocky, RockyPlanets).
% Expected Output: RockyPlanets = [mercury, venus, earth, mars].

% To find planets within a specific distance range:
% ?- planets_within_distance(5, 20, NearbyPlanets).
% Expected Output: NearbyPlanets = [jupiter, saturn, uranus].

% To find planets with a distance greater than 10 AU:
% ?- planet(Name, Type, Distance), Distance > 10.
% Expected Output:
% Name = uranus,
% Type = gas_giant,
% Distance = 19.22 ;
% Name = neptune,
% Type = gas_giant,
% Distance = 30.05.
