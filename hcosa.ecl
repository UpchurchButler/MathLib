/**
 *Approximates the inverse hyperbolic cosine function for a user inputted value.
 *Inverse hyperbolic functions are sometimes called "area hyperbolic functions"-- defined as acosh in some other languages.
 *@param x represents the value whose area hyperbolic cosine is computed.
 *@return evaluated inverse hyperbolic cosine in DEGREES.
 */

Export real8 HCosA(Real8 x) := BEGINC++
  #define conversionFactor 57.29577951308232
  #define epsilon 0.000000001
  double result = (acosh(x)) * conversionFactor;
  
if (-epsilon < result and result < epsilon){result = 0;}

return result;
  
ENDC++;  
