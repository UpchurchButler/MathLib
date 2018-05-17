/**
 *Approximates the arctan function with 2 parameters for user inputted values.
 *ArcTan2 is equlivient to ArcTan(y/x). 
 *@param y represents the proportion of the y-coordinate. 
 *@param x represents the proportion of the x-coordinate.
 *@return evaluated arctan2 in DEGREES.
 */

Export real8 ArcTan2(Real8 y,x) := BEGINC++
  #define conversionFactor 57.29577951308232
  #define epsilon 0.000000001
  double result = (atan2(y,x)) * conversionFactor;
  
if (-epsilon < result and result < epsilon){result = 0;} 

return result;
  
ENDC++;  
