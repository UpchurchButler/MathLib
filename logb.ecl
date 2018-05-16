/**
*Calculates the floating-point based logarithm of |x|.
*@param x, a given value. 
*@return result, the logarithm of the absolute value of x.
*/


EXPORT REAL8 LOGB(REAL8 x) := BEGINC++
 #option pure
 #include <math.h> 
  
 double result = logb(x);

return result;

ENDC++;
