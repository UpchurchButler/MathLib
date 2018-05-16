/**
 *Approximates the inverse hyperbolic tangent function for a user inputted value.
 *Inverse hyperbolic functions are sometimes called "area hyperbolic functions" listed as atanh in some other languages.
 *@param x, represents the value whose area hyperbolic tangent is computed.
 *@return result, evaluated inverse hyperbolic tangent in DEGREES.
 */

Export real8 HTanA(Real8 x) := BEGINC++
  #define conversionFactor 57.29577951308232
  double result = (atanh(x)) * conversionFactor;
  
if (-0.0000001 < result and result < 0.0000001){result = 0;} 

return result;
  
ENDC++;  
