/**
*Calculates the natural log of (1 + x).
*@param x, a given value. 
*@return result, ln(1+x).
*/


EXPORT REAL8 LOG1P(REAL8 x) := BEGINC++
 #option pure
 #include <math.h> 
  
 double result = log1p(x);

return result;

ENDC++;
