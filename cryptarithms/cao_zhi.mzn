include"alldifferent.mzn";
 var 1..9:C;
 var 0..9:A;
 var 0..9:O;
 
 var 1..9:Z;
 var 0..9:H;
 var 0..9:I;
 
 var 1..9:P;
% var 0..9:I;
 
 var 1..9:T;
 var 0..9:E;
 var 0..9:S;
%var 1..9:T;

constraint alldifferent([C,A,O,Z,H,I,P,T,E,S]);

constraint 2*(100 * C + 10 * A + O) +% 0 * O)+
           100 * Z + 10 * H + I +
           10 * P + I =
           1000 * T + 100 * E + 10 * S + T;
constraint P = 3*Z;
constraint O = 0;
           
solve satisfy;

