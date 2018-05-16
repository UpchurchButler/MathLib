/*Calculates e raised to a power given by the user.
 *@param x, represents the power to which e is raised.
 *@return result, evaluated exponential function (e^x).
 */

Export real8 XPO(Real8 x) := BEGINC++

  double result = (exp(x));
 
return result;
  
ENDC++;  
