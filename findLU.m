function [L,U,Permutation] = findLU(A)
% input matrix must be square matrix, no column should be entirely 0 in the lower left 
% decomposes matrix into LU matrices

% initialize
U = A;
Permutation = eye(size(A)); % save permutation operations

% L is identity matrix to start
L = zeros(size(A));
I = eye(size(A));

% operation to obtain L & U matrix
for lv1 = 1:size(A,1)-1     % reference row

    % find index of max value in column
    [~,index] = max(abs(U(lv1:size(A,1),lv1))); % find max 
    
    if (index == 1)
        % pivot correct, continue
    else
        index = index + lv1 - 1;    % absolute index
        
        P = eye(size(A)); % permutation matrix

        % compute row swaps
        temp_row = P(lv1,:);
        P(lv1,:) = P(index,:);
        P(index,:) = temp_row;
        
        Permutation = P*Permutation;
        
        % perform row swaps
        U = P*U;
        L = P*L;
    end
    
    for lv2 = (lv1+1):size(A,1)     % row to subtract from
        % L matrix is created from the I matrix with conjugate operations
        % of the operations done on the U matrix
        L(lv2,lv1) = U(lv2,lv1)./U(lv1,lv1);
        % U matrix created by Gaussian elimination
        U(lv2,:) = U(lv2,:) - (U(lv2,lv1)./U(lv1,lv1).*U(lv1,:));

    end

end

% turn into standard L matrix
L = L + I;

end
