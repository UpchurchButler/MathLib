/**
*Calculates the natural log of a user inputted value.
*@param x, a given value. 
*@return result, the logarithm of x.
*/


EXPORT REAL8 LOGX(REAL8 x) := BEGINC++
 #option pure
 #include <math.h> 
  
 double result = log(x);

return result;

ENDC++;
