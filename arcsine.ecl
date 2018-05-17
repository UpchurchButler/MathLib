/**
 *Approximates the arcsine function for a user inputted value. 
 *@param x, the value for which to find arcsine.
 *@return arcsine in DEGREES.
 */

Export real8 ArcSine(Real8 x) := BEGINC++
  #define conversionFactor 57.29577951308232
  #define epsilon 0.000000001
  double p, result;
  p = x;
  result = (asin(p)) * conversionFactor;
  
if (-epsilon < result and result < epsilon){result = 0;} 

return result;
  
ENDC++;
