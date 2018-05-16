/**
*Calculates the error function evaluated at a given point.
*@param x, the x value.
*@return result, error function evaluated at x.
*/


EXPORT REAL8 ERF(REAL8 x) := BEGINC++
 #option pure
 #include <math.h> 
  
 double result = erf(x);

return result;

ENDC++;
