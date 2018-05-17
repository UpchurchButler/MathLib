/** 
 *Evaluates the tangent function for a user inputted angle in degrees. 
 *@param x, the value of the angle for which to find tangent.
 *@return result evaluated tangent
 */

EXPORT REAL8 Tangent(REAL8 x) := BEGINC++
  #define conversionFactor 0.0174532925199428
  #define epsilon 0.000000001
  double p, result, check;
  p = x;
  check = (fabs(p))/90;
  result = tan (p * conversionFactor);
  
if (-epsilon < result and result < epsilon){result = 0;}
if (fabs(result) > 0.99999 and fabs(result < 1)) {result = 1;}
if (fmod(check, 2) == 1){return sqrt(-1);}
else return result;
  
ENDC++;

