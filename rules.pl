submit_rule(submit(CR, S, V)) :-
    base(CR, S, V),
    CR = label(_, ok(Reviewer)),
    gerrit:commit_author(Author,_,Email),
    user_ok(Author,Reviewer,Email),
    !.

user_ok(C,R,E):-
    C\=R;
    E='ferhatcapar@gmail.com'.

submit_rule(submit(CR, S , V ,N)) :-
    base(CR, S, V),
    N = label('Non-Author-Code-Review', need(_)).

base(CR, S, V) :-
    gerrit:max_with_block(-2, 2, 'Code-Review', CR),
    gerrit:max_with_block(-1, 1, 'Sonar-Verified', S),
    gerrit:max_with_block(-1, 1, 'Verified', V).
