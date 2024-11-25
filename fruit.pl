% Facts about fruits and their colors
fruit_color(apple, red).
fruit_color(banana, yellow).
fruit_color(grape, purple).
fruit_color(orange, orange).
fruit_color(lemon, yellow).
fruit_color(strawberry, red).

% Predicate to retrieve the color of a fruit
color_of_fruit(Fruit, Color) :-
    fruit_color(Fruit, Color).

% Example queries
?- color_of_fruit(apple, Color).
Color = red.

?- color_of_fruit(banana, Color).
Color = yellow.

?- color_of_fruit(grape, Color).
Color = purple.
