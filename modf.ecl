/**
*Breaks a float value into its intergral and fractional parts.
*@param x, a given float value. 
*@return result, the fractional part of x, with the same sign.
*/

EXPORT REAL8 MODF(REAL8 x) := BEGINC++
 #option pure

  double result;
  double y;
  result = modf(x, &y);

return result;

ENDC++;
