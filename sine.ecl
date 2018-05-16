/** 
 *Evaluates the sine function for a user inputted angle in degrees. 
 *@param x, the value of the angle for which to find sine.
 *@return result, evaluated sine.
 */

EXPORT REAL8 Sine(REAL8 x) := BEGINC++
  #define conversionFactor 0.0174532925199428
  double p, result;
  p = x;
  result = sin (p * conversionFactor);
  
if (-0.0000001 < result and result < 0.0000001){result = 0;} 

return result;
  
ENDC++;
