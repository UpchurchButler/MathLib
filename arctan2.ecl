/**
 *Approximates the arctan function with 2 parameters for user inputted values.
 *ArcTan2 is equlivient to ArcTan(y/x). 
 *@param y represents the proportion of the y-coordinate. 
 *@param x represents the proportion of the x-coordinate.
 *@return evaluated arctan2 in DEGREES.
 */

Export real8 ArcTan2(Real8 y,x) := BEGINC++
  #define conversionFactor 57.29577951308232
  double result = (atan2(y,x)) * conversionFactor;
  
if (-0.0000001 < result and result < 0.0000001){result = 0;} 

return result;
  
ENDC++;  
