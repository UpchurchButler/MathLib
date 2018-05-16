/**
*Calculates (e raised to the power x) minus one.
*@param x, the power to which e is raised.
*@return result, [(e^x)-1]
*/


EXPORT REAL8 EXPM1(REAL8 x) := BEGINC++
 #option pure
 #include <math.h> 
  
 double result = expm1(x);

return result;

ENDC++;
