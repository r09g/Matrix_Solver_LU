# Matrix_Solver_LU
Solves AX = B system for X using LU decomposition

## Description
- findLU: <br/>
Input: square matrix with no column, in the lower left of the matrix, completely zero.
Result: L the lower left matrix; U the upper right matrix; P the permutation matrix.
- msolve: <br/>
Calls the findLU function and solves a system AX = B
