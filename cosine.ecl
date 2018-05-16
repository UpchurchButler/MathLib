/** 
 *Evaluates the cosine function for a user inputted angle in degrees. 
 *@param x, the value of the angle for which to find cosine.
 *@return evaluated cosine.
*/

EXPORT REAL8 Cosine(REAL8 x) := BEGINC++
  #define conversionFactor 0.0174532925199428
  double p, result;
  p = x;
  result = cos (p * conversionFactor);
  
if (-0.0000001 < result and result < 0.0000001){result = 0;} 

return result;
  
ENDC++;
