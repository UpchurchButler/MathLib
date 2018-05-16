/**
 *Approximates the inverse hyperbolic cosine function for a user inputted value.
 *Inverse hyperbolic functions are sometimes called "area hyperbolic functions"-- defined as acosh in some other languages.
 *@param x represents the value whose area hyperbolic cosine is computed.
 *@return evaluated inverse hyperbolic cosine in DEGREES.
 */

Export real8 HCosA(Real8 x) := BEGINC++
  #define conversionFactor 57.29577951308232
  double result = (acosh(x)) * conversionFactor;
  
if (-0.000000001 < result and result < 0.000000001){result = 0;} 

return result;
  
ENDC++;  
