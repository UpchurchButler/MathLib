/**
 *Approximates the inverse hyperbolic tangent function for a user inputted value.
 *Inverse hyperbolic functions are sometimes called "area hyperbolic functions" listed as atanh in some other languages.
 *@param x, represents the value whose area hyperbolic tangent is computed.
 *@return result, evaluated inverse hyperbolic tangent in DEGREES.
 */

Export real8 HTanA(Real8 x) := BEGINC++
  #define conversionFactor 57.29577951308232
  #define epsilon 0.000000001
  double result = (atanh(x)) * conversionFactor;
  
if (-epsilon < result and result < epsilon){result = 0;}

return result;
  
ENDC++;  
