enum MOVES;
int: timeBound;
array[MOVES] of int: power;
array[MOVES] of int: duration;

array[MOVES] of var 0..1: occur;

constraint(sum(i in MOVES)(duration[i]*occur[i]))<= timeBound;

solve maximize sum(i in MOVES)(power[i]*occur[i]);
