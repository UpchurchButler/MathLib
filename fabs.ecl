/**
*Calculates the absolute value of x.
*@param x, the input value.
*@return result, abs(x).
*/


EXPORT REAL8 FABS(REAL8 x) := BEGINC++
 #option pure
 #include <math.h> 
  
 double result = fabs(x);

return result;

ENDC++;
