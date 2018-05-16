/**
 *Approximates the inverse hyperbolic sine function for a user inputted value.
 *Inverse hyperbolic functions are sometimes called "area hyperbolic functions" listed as asinh in some other languages.
 *@param x, represents the value whose area hyperbolic sine is computed.
 *@return result, evaluated inverse hyperbolic sine in DEGREES.
 */

Export real8 HSinA(Real8 x) := BEGINC++
  #define conversionFactor 57.29577951308232
  double result = (asinh(x)) * conversionFactor;
  
if (-0.0000001 < result and result < 0.0000001){result = 0;} 

return result;
  
ENDC++; 
