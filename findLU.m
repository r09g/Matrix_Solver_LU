function [L,U] = findLU(A)
% input matrix must be square matrix
% decomposes matrix into LU matrices

% initialize
U = A;

% L is identity matrix to start
L = eye(size(A,1));
I = eye(size(A,1));

% operation to obtain L & U matrix
for lv1 = 1:size(A,1)-1     % reference row
    for lv2 = (lv1+1):size(A,1)     % row to subtract from
        % L matrix is created from the I matrix with conjugate operations
        % of the operations done on the U matrix
        L(lv2,:) = L(lv2,:) + (U(lv2,lv1)./U(lv1,lv1).*I(lv1,:));
        % U matrix created by Gaussian elimination
        U(lv2,:) = U(lv2,:) - (U(lv2,lv1)./U(lv1,lv1).*U(lv1,:));
    end
end

end
