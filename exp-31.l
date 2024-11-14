person(alice, 25, engineer).
person(bob, 30, doctor).
person(charlie, 20, student).

% Rules
is_adult(Person) :- person(Person, Age, _), Age >= 18.
is_engineer(Person) :- person(Person, _, engineer).
is_doctor(Person) :- person(Person, _, doctor).
is_student(Person) :- person(Person, _, student).

% Pattern matching queries
match_person(Person) :-
    person(Person, Age, Occupation),
    writeln(Person + ' is a ' + Occupation + ' and ' + Age + ' years old.').
% Pattern rules
match_pattern([a, b]).
match_pattern([a, b, b]).
match_pattern([a, a, b]).
match_pattern([a, c, d]).

% Pattern matching rule
matches_pattern(List) :-
    match_pattern(Pattern),
    Pattern = List.

% Query for matching patterns with additional details
pattern_match(List, Pattern) :-
    match_pattern(Pattern),
    Pattern = List,
    write('Match found for pattern: '), writeln(Pattern).

% Test pattern match against multiple patterns
find_matches(List) :-
    findall(Pattern, matches_pattern(List), Matches),
    ( Matches \= [] ->
        write('Patterns matched: '), writeln(Matches);
        writeln('No patterns matched.')
    ).
