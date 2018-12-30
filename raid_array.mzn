% select a set of raiding warrior
enum WARRIOR;
WARRIOR: dummy; 
enum CLAN; % the clan they belong too

int: l; % minimum raid party size
int: u; % maximum raid party size
int: m; % limit of hatreds

array[WARRIOR] of int: strength;
array[WARRIOR] of CLAN: clan;
array[CLAN,CLAN] of 0..1: hates;
array[1..u] of var WARRIOR: party;
%clan =    [ DC, C1, C1, C1, C2, C2, C2, C3, C3, C4, C4 ];
%WARRIOR = { D,  W1, W2, W3, W4, W5, W6, W7, W8, W9, W10 };
%hates = [| 0,| 0, 0, 0, 0  ==> DC hates nobody
%         | 0,| 0, 1, 0, 0  ==> C1 hates C2
%         | 0,| 1, 0, 0, 1  ==> C2 hates C1
%         | 0,| 0, 0, 0, 0  ==> C3 hates nobody
%         | 0,| 0, 1, 0, 0 |];> C4 hates C2

constraint forall(i in 1..l)(party[i] > dummy);

constraint forall(i in 1..u-1)(party[i] >= party[i+1] + (party[i+1] != dummy));

var int: obj = sum(i in 1..u where party[i] != dummy)(strength[party[i]]);

constraint(forall(i in 1..u-1) (party[i] >= party[i + 1] + (party[i] != dummy)));
constraint(sum(i, j in 1..u where i > j)(hates[clan[party[i]],clan[party[j]]]) <= m);
constraint(forall(i in 1..l) (party[i] != dummy));

output ["raid= {"]  ++
       [if fix(party[i]) != dummy then show(party[i]) ++
        if i < u /\ fix(party[i+1]) != dummy then ", " else "" endif
        else "" endif | i in 1..u ] ++ 
       ["};\n"] ++
       ["obj = ", show(obj)];


solve maximize obj;