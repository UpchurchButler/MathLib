/**
 *Approximates the hyperbolic tangent function for a user inputted value.
 *@param x represents a given hyperbolic angle.
 *@return evaluated hyperbolic tangent in DEGREES.
 */

Export real8 HTan(Real8 x) := BEGINC++
  #define conversionFactor 57.29577951308232
  double result = (tanh(x)) * conversionFactor;
  
if (-0.0000001 < result and result < 0.0000001){result = 0;} 

return result;
  
ENDC++;  
