%Some enemy soldiers, along with their families, were captured during the war.
%The coalition plans to put them into prison cells in a grid,
%according to some rules.
%No two prisoners could be put into the same cell.
%Some prisoners were so
%dangerous that no prisoners could be put in any of the adjacent cells.
%Female prisoners could be put in the cells of the upper half of the grid,
%while male prisoners could be put in cells at the lower half.
%Each cell had a different maintenance cost, and the coalition needed to allocate
%the prisoners to the cells so that the total maintenance cost was minimized.

include "alldifferent.mzn";

enum PRISONER;

int: n;  % number of rows in prison grid
set of int: ROW = 1..n;

int: m;  % number of columns in prison grid
set of int: COL = 1..m;

array[ROW,COL] of int: cost;
set of PRISONER: danger;
set of PRISONER: female;
set of PRISONER: male = PRISONER diff female;

array[PRISONER] of var ROW: r;
array[PRISONER] of var COL: c;

constraint alldifferent([r[p]*m + c[p] | p in PRISONER]);

constraint forall (p in female) (r[p] <= ((n + 1) div 2));
constraint forall (p in male) (r[p] > ((n + 1) div 2));

constraint forall (d in danger, p in PRISONER where d != p) ((abs(r[d] - r[p]) + abs(c[d] - c[p])) > 1);

var int: tCost = sum (p in PRISONER) (cost[r[p],c[p]]);
solve minimize tCost;

output["Female: "++show(p)++" in cell["++show(r[p])++","++show(c[p])++"]\n" | 
      p in female]
  ++ ["\n"]++["Male: "++show(p)++" in cell["++show(r[p])++","++show(c[p])++"]\n" | 
      p in male]
  ++ ["\nTotal Cost: ",show(tCost)];
