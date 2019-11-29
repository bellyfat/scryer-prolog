
:- use_module(library(lists)).

test_queries_on_builtins :-
    \+ atom(_),
    atom(a),
    \+ atom("string"),
    atom([]),
    \+ atom(1),
    \+ atom(0),
    \+ atom(0.0),
    \+ atom([a,b,c]),
    \+ atom(atop(the_trees)),
    \+ atomic(_),
    atomic(a),
    atomic("string"),
    atomic([]),
    atomic(1),
    atomic(0),
    atomic(0.0),
    \+ atomic([a,b,c]),
    \+ atomic(atop(the_trees)),
    ( var(X), X = 3, atomic(X) ),
    \+ ( var(X), X = 3, var(X) ),
    arg(1, f(a,b,c,d), a),
    arg(2, f(a,b,c,d), b),
    arg(3, f(a,b,c,d), c),
    arg(4, f(a,b,c,d), d),
    catch(arg(_, f, _), error(instantiation_error, _), true),
    \+ arg(1, f(arg, not_arg, not_arg), not_arg),
    arg(2, f(arg, not_arg, not_arg), not_arg),
    arg(3, f(arg, not_arg, not_arg), not_arg),
    functor(f(a,b,c), f, 3),
    catch(functor(_,"sdf",3),error(type_error(atom,[s,d,f]),_),true),
    f(1,2,3) =.. [f,1,2,3],
    length([a,b,c], 3),
    copy_term([[[[X,Y],Y],X]],[[[[Z,V],V],Z]]),
    \+ ( X = g(X,Y), Y = f(X), copy_term(Y,g(Z)) ),
    (X = g(X,Y), Y = f(X), copy_term(Y,f(Z))),
    float(3.14159269),
    \+ float(3),
    \+ float("sdfsa"),
    \+ float(structure(functor)),
    \+ float([1,2,3]),
    \+ float([1,2,_]),
    \+ (X is 3 rdiv 4, float(X)),
    ( X is 3 rdiv 4, rational(X) ),
    \+ rational(3),
    \+ rational(f(_)),
    \+ rational("sdfa"),
    \+ rational(atom),
    \+ rational(structure(f)),
    \+ rational([1,2,3]),
    \+ rational([1,2,_]),
    compound(functor(compound)),
    compound(f(_)),
    compound([1,2,3]),
    \+ compound([]),
    \+ compound(3.14159269),
    \+ compound(3),
    \+ compound("sdfsa"),
    \+ compound(atom).    

:- initialization(test_queries_on_builtins).