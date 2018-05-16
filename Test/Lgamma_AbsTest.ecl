/* Test code for log-gamma and absolute calue functions 
 *@param x, a numeric value passed to each function
 *@return value is numeric
 */

Import STD as Lib;

testData := RECORD
  REAL x;
END;

resultData := RECORD
  STRING funcName;
  REAL x;
  REAL result;
  REAL expected;
  UNSIGNED errors;
END;
epsilon  := .000000001;

testPoints := DATASET([{-1.5},
                        {5},
			{0.7}], testData);

tf := RECORD
  STRING funcName;
  SET OF REAL expt;
END;

allTF := DATASET([{'Log-Gamma', [-0.120782237,3.178053830,0.260867246]},
		{'Absolute Value of x', [1.5,5,0.7]}], tf);


tdExp := RECORD
  {testData};
  {tf};
END;

resultData doAny(tdExp test, UNSIGNED c) := TRANSFORM
  funcName := test.funcName;
  x := test.x;
  expt := test.expt;
  SELF.funcName := funcName;
  SELF.x := x;

/*All functions mapped here*/
  
  SELF.result := map(funcName = 'Log-Gamma' 	=> 		Lib.lgamma(x),
								Lib.fabs(x));
																						
   
/*Modulo used to count e.g. 1, 2, 1, 2*/
  
  SELF.expected := expt[((c-1) % COUNT(testPoints)) + 1];
  SELF.errors := IF(ABS(SELF.result - SELF.expected) > epsilon, 1, 0);
END;

/*JOIN together the test functions and the data, so that we have one record per data point per function*/

allTests := JOIN(allTF, testPoints, TRUE, TRANSFORM(tdExp, SELF := LEFT, SELF := RIGHT), ALL);

/* All the tests run at once here*/
results := PROJECT(allTests, doAny(LEFT, COUNTER));   
OUTPUT(results, NAMED('Results'));

