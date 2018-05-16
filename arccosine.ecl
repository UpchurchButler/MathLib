/**
 *Approximates the arccosine function for a user inputted value. 
 *@param x, the value for which to find arc cosine.
 *@return evaluated arccosine DEGREES.
 */

Export real8 ArcCosine(Real8 x) := BEGINC++
  #define conversionFactor 57.29577951308232
  double p, result;
  p = x;
  result = (acos(p)) * conversionFactor;
  
if (-0.0000001 < result and result < 0.0000001){result = 0;} 

return result;
  
ENDC++;  
