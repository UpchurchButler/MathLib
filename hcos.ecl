/**
 *Approximates the hyperbolic cosine function for a user inputted value.
 *@param x, represents a given hyperbolic angle.
 *@return result, evaluated hyperbolic cosine in DEGREES.
 */

Export real8 HCos(Real8 x) := BEGINC++
  #define conversionFactor 57.29577951308232
  double result = (cosh(x)) * conversionFactor;
  
if (-0.0000001 < result and result < 0.0000001){result = 0;} 

return result;
  
ENDC++;  
