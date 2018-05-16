/**
*Computes a value, given a significand and an exponent as parameters.
*@param x = the base significand that will be multiplied by power of 2.
*@param y = the exponent power of two. Example: 2^y. 
*@return the calculated value of (x * 2^y).
*/

EXPORT REAL8 LDEXP(REAL8 x,y) := BEGINC++
 #option pure
  double result;
  result = ldexp(x,y);
  
return result;

ENDC++;
