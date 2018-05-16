/**
*Calculates the base-2 exponential function of a value.
*@param x, the power to which 2 is raised.
*@return result, evaluated 2^x.
*/

EXPORT REAL8 XPO2(REAL8 x) := BEGINC++
 #option pure
  
 double result = exp2(x);

return result;

ENDC++;
