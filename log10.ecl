/**
*Calculates the common log of x.
*@param x =  a given value .
*@return the base-10 logarithm of x.
*/


EXPORT REAL8 LOG10(REAL8 x) := BEGINC++
 #option pure
 #include <math.h> 
  
 double result = log10(x);

return result;

ENDC++;
