/**
 *Approximates the inverse hyperbolic sine function for a user inputted value.
 *Inverse hyperbolic functions are sometimes called "area hyperbolic functions" listed as asinh in some other languages.
 *@param x, represents the value whose area hyperbolic sine is computed.
 *@return result, evaluated inverse hyperbolic sine in DEGREES.
 */

Export real8 HSinA(Real8 x) := BEGINC++
  #define conversionFactor 57.29577951308232
  #define epsilon 0.000000001
  double result = (asinh(x)) * conversionFactor;
  
if (-epsilon < result and result < epsilon){result = 0;} 

return result;
  
ENDC++; 
