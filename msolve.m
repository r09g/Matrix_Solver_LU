function [X,M_A] = msolve(A,B)
% Solves system AX = B for X

% find LU decomposition
[L,U,P] = findLU(A);

% apply permutations to solution vector
B = P*B;

% initialize Y matrix
Y = zeros(size(L,1),1);
% solve LY = B
for lv1 = 1:size(L,1)
    Y(lv1,1) = Y(lv1,1) + B(lv1,1);
    for lv2 = 1:lv1-1
        Y(lv1,1) = Y(lv1,1) - L(lv1,lv2)*Y(lv2,1);
    end
end

% initialize X matrix
X = zeros(size(U,1),1);
% solve UX = Y for X
X(size(U,1),1) = Y(size(Y,1),1)/U(size(U,1),size(U,1));
for lv1 = size(U,1)-1:-1:1
    % for rightmost element of the row in the rightmost column
    X(lv1,1) = X(lv1,1) + Y(lv1,1)/U(lv1,lv1);
    for lv2 = size(U,1):-1:(lv1+1)
        % fill the row
        X(lv1,1) = X(lv1,1) - (U(lv1,lv2)*X(lv2,1))/U(lv1,lv1);
    end
end

    M_A = memory;

end

