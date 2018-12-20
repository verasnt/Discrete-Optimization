
enum DISH;
int: capacity;
array[DISH] of int: satisfaction;
array[DISH] of int: size;

array[DISH] of var int: amount;

constraint forall(i in DISH)(amount[i]>=0);
constraint sum(i in DISH)(size[i]* amount[i]) <= capacity;
solve maximize sum(i in DISH)(satisfaction[i] * amount[i]);

output ["Amount = ", show(amount), "\n"];
