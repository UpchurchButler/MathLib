/**
*Calculates the binary log of x.
*@param x, a given value. 
*@return result, the binary (base-2) logarithm of x.
*/


EXPORT REAL8 LOG2(REAL8 x) := BEGINC++
 #option pure
 #include <math.h> 
  
 double result = log2(x);

return result;

ENDC++;
