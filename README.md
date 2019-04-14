# Matrix_Solver_LU
Solves AX = B system for X using LU decomposition. <br/>

Converts Matrix __A__ into __L__ (with ones on the diagonal) and __U__ matrix.

## Description
- __findLU__: <br/>
Input: square matrix with no column, in the lower left of the matrix, completely zero. <br/>
Result: L the lower left matrix; U the upper right matrix; P the permutation matrix.
- __msolve__: <br/>
Calls the findLU function and solves a system AX = B

## Timing Analysis

The functions are tested by using Matlab's magic(n) function to generate a random n x n square matrix.

- __findLU__ function:
<img src="https://github.com/yanghaoqin/Matrix_Solver_LU/blob/master/Analysis/Timing_Analysis.PNG">

- __lu__ function by Matlab (Note the scale of the vertical axis Time):
<img src="https://github.com/yanghaoqin/Matrix_Solver_LU/blob/master/Analysis/Timing_Analysis_Matlab.PNG">

- __YES__, Matlab's lu function is around 422 times faster than my findLU, compared at matrix dimension 1600 x 1600.
