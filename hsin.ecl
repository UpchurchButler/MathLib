/**
 *Approximates the hyperbolic sine function for a user inputted value
 *@param x, represents a given hyperbolic angle
 *@return result, evaluated hyperbolic sine in DEGREES
 */

Export real8 HSin(Real8 x) := BEGINC++
  #define conversionFactor 57.29577951308232
  double result = (sinh(x)) * conversionFactor;
  
if (-0.0000001 < result and result < 0.0000001){result = 0;} 

return result;
  
ENDC++;  
