% Tetravex n*n
int: n;
array[1..n*n,1..4] of int: pieces;
set of int: N = 1..n;

%positions of each piece in the table (solution)
array[1..n*n,1..2] of var N: p;

%No two pieces in the same position
%constraint forall(i in 1..((n*n)-1)) (forall(j in i+1..(n*n)) (if p[i,1]==p[j,1] then p[i,2]!=p[j,2] endif));

% %The piece at the right (piece j) must have the same number at the left as piece i has at the right
% constraint forall(i in 1..(n*n)) (forall(j in i+1..(n*n)) (if p[i,1]==p[j,1] /\ p[j,2]==p[i,2]+1 then pieces[i,3]==pieces[j,1] endif));

% %The piece at the left (piece j) must have the same number at the right as piece i has at the left
% constraint forall(i in 1..(n*n)) (forall(j in i+1..(n*n)) (if p[i,1]==p[j,1] /\ p[j,2]==p[i,2]-1 then pieces[i,1]==pieces[j,3] endif));

% %The piece at the bottom (piece j) must have the same number at the top as piece i has at the bottom
% constraint forall(i in 1..(n*n)) (forall(j in i+1..(n*n)) (if p[i,2]==p[j,2] /\ p[j,1]==p[i,1]+1 then pieces[i,4]==pieces[j,2] endif));

% %The piece at the top (piece j) must have the same number at the bottom as piece i has at the top
% constraint forall(i in 1..(n*n)) (forall(j in i+1..(n*n)) (if p[i,2]==p[j,2] /\ p[j,1]==p[i,1]-1 then pieces[i,2]==pieces[j,4] endif));

%All constraints at once
constraint forall(i in 1..(n*n)-1) (forall(j in i+1..(n*n)) 
(if p[i,1]==p[j,1] /\ p[j,2]==p[i,2]+1 then pieces[i,3]==pieces[j,1] 
elseif p[i,1]==p[j,1] /\ p[j,2]==p[i,2]-1 then pieces[i,1]==pieces[j,3] 
elseif p[i,2]==p[j,2] /\ p[j,1]==p[i,1]+1 then pieces[i,4]==pieces[j,2] 
elseif p[i,2]==p[j,2] /\ p[j,1]==p[i,1]-1 then pieces[i,2]==pieces[j,4] 
elseif p[i,1]==p[j,1] then p[i,2]!=p[j,2] 
else true endif));


% Find a solution that satisfies the constraints
solve satisfy;
           
output [ "Piece \(i): [\(pieces[i,1]),\(pieces[i,2]),\(pieces[i,3]),\(pieces[i,4])] in position [\(p[i,1]),\(p[i,2])]\n" | i in 1..(n*n) ];