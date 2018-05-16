/**
 *Approximates the arcsine function for a user inputted value. 
 *@param x, the value for which to find arcsine.
 *@return arcsine in DEGREES.
 */

Export real8 ArcSine(Real8 x) := BEGINC++
  #define conversionFactor 57.29577951308232
  double p, result;
  p = x;
  result = (asin(p)) * conversionFactor;
  
if (-0.0000001 < result and result < 0.0000001){result = 0;} 

return result;
  
ENDC++;
