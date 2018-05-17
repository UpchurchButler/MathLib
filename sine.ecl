/** 
 *Evaluates the sine function for a user inputted angle in degrees. 
 *@param x, the value of the angle for which to find sine.
 *@return result, evaluated sine.
 */

EXPORT REAL8 Sine(REAL8 x) := BEGINC++
  #define conversionFactor 0.0174532925199428
  #define epsilon 0.000000001
  double p, result;
  p = x;
  result = sin (p * conversionFactor);
  
if (-epsilon < result and result < epsilon){result = 0;}

return result;
  
ENDC++;
