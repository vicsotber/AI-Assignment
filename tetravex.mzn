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

%The piece at the right (piece j) must have the same number at the left as piece i has at the right
constraint forall(i in 1..(n*n)-1) (forall(j in i+1..(n*n)) (if p[i,1]==p[j,1] /\ p[j,2]==p[i,2]+1 then p[i,2]!=p[j,2] /\ pieces[i,3]==pieces[j,1] elseif p[i,1]==p[j,1] /\ p[j,2]==p[i,2]-1 then p[i,2]!=p[j,2] /\ pieces[i,1]==pieces[j,3] elseif p[i,2]==p[j,2] /\ p[j,1]==p[i,1]+1 then pieces[i,4]==pieces[j,2] elseif p[i,2]==p[j,2] /\ p[j,1]==p[i,1]-1 then pieces[i,2]==pieces[j,4] elseif p[i,1]==p[j,1] then p[i,2]!=p[j,2] else true endif));


% Find a solution that satisfies the constraints
solve satisfy;
    
% output ["Piece 1: [\(pieces[1,1]),\(pieces[1,2]),\(pieces[1,3]),\(pieces[1,4])] in position [\(p[1,1]),\(p[1,2])]\n",
%         "Piece 2: [\(pieces[2,1]),\(pieces[2,2]),\(pieces[2,3]),\(pieces[2,4])] in position [\(p[2,1]),\(p[2,2])]\n",
%         "Piece 3: [\(pieces[3,1]),\(pieces[3,2]),\(pieces[3,3]),\(pieces[3,4])] in position [\(p[3,1]),\(p[3,2])]\n",
%         "Piece 4: [\(pieces[4,1]),\(pieces[4,2]),\(pieces[4,3]),\(pieces[4,4])] in position [\(p[4,1]),\(p[4,2])]\n",
%         "Piece 5: [\(pieces[5,1]),\(pieces[5,2]),\(pieces[5,3]),\(pieces[5,4])] in position [\(p[5,1]),\(p[5,2])]\n",
%         "Piece 6: [\(pieces[6,1]),\(pieces[6,2]),\(pieces[6,3]),\(pieces[6,4])] in position [\(p[6,1]),\(p[6,2])]\n",
%         "Piece 7: [\(pieces[7,1]),\(pieces[7,2]),\(pieces[7,3]),\(pieces[7,4])] in position [\(p[7,1]),\(p[7,2])]\n",
%         "Piece 8: [\(pieces[8,1]),\(pieces[8,2]),\(pieces[8,3]),\(pieces[8,4])] in position [\(p[8,1]),\(p[8,2])]\n",
%         "Piece 9: [\(pieces[9,1]),\(pieces[9,2]),\(pieces[9,3]),\(pieces[9,4])] in position [\(p[9,1]),\(p[9,2])]\n"];
        
output [ "Piece \(i): [\(pieces[i,1]),\(pieces[i,2]),\(pieces[i,3]),\(pieces[i,4])] in position [\(p[i,1]),\(p[i,2])]\n" | i in 1..(n*n) ];