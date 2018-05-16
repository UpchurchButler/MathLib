/**
 *Calculates the complementary error function value of a given point. 
 *@param x, the x value.
 *@return result, complementary error function evaluated at x.
*/


EXPORT REAL8 ERFC(REAL8 x) := BEGINC++
 #option pure
 #include <math.h> 
  
 double result = erfc(x);

return result;

ENDC++;
