/**
*Returns integral part of the logarithm of |x|.
*@param x, value whose ilogb is calculated.
*@return result, base log of x. 
*/


EXPORT REAL8 ILOGB(REAL8 x) := BEGINC++
 #option pure
 #include <math.h> 
  
 double result = ilogb(x);

return result;

ENDC++;
