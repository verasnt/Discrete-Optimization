int: nSpots;
set of int: SPOT = 1..nSpots;
array[SPOT] of int: damage;
enum SYMB;
array[SYMB] of set of SPOT:group;
int: size;

set of int: SPOTx = {0} union SPOT;
array[1..size] of var SPOTx: attacks;

constraint forall(i in 1..size-1)(attacks[i]>=
                  (attacks[i] != 0)+ attacks[i+1]);
constraint forall(s in SYMB)(sum(i in 1..size)
                  (attacks[i] in group[s])<=1);
                  
var int: totalDamages = sum(p in attacks where p > 0)(damage[p]);
solve maximize (totalDamages);
