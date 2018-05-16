/* Test code for error and complementary error functions 
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

testPoints := DATASET([{-1},
                        {0},
												{0.7}], testData);

tf := RECORD
  STRING funcName;
  SET OF REAL expt;
END;

allTF := DATASET([{'Error Function', [-0.842700792,0,0.677801193]},
									{'Complementary Error Function', [1.842700792,1,0.322198806]}], tf);


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
  
  SELF.result := map(funcName = 'Error Function' 	=> 				Lib.erf(x),
																														Lib.erfc(x));
																						
   
/*Modulo used to count e.g. 1, 2, 1, 2*/
  
  SELF.expected := expt[((c-1) % COUNT(testPoints)) + 1];
  SELF.errors := IF(ABS(SELF.result - SELF.expected) > epsilon, 1, 0);
END;

/*JOIN together the test functions and the data, so that we have one record per data point per function*/

allTests := JOIN(allTF, testPoints, TRUE, TRANSFORM(tdExp, SELF := LEFT, SELF := RIGHT), ALL);

/* All the tests run at once here*/
results := PROJECT(allTests, doAny(LEFT, COUNTER));   
OUTPUT(results, NAMED('Results'));

