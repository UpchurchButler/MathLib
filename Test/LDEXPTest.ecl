/**
*Test code for generating a vlue from a significand and exponent.
*@param x, Floating point value representing the significand.
*@param y, Value of the exponent.
*/

Import  $.^ as Lib;

testData := RECORD
  REAL x;
  REAL y;
END;

resultData := RECORD
  STRING funcName;
  REAL x;
  REAL y;
  REAL result;
  REAL expected;
  UNSIGNED errors;
END;
epsilon  := .000000001;

testPoints := DATASET([{5, 0},
                        {1, 5},
												{15.5, 3}], testData);

tf := RECORD
  STRING funcName;
  SET OF REAL expt;
END;

allTF := DATASET([{'LDEXP', [5,32,124]}], tf);


tdExp := RECORD
  {testData};
  {tf};
END;

resultData doAny(tdExp test, UNSIGNED c) := TRANSFORM
  funcName := test.funcName;
  x := test.x;
  y := test.y;
  expt := test.expt;
  SELF.funcName := funcName;
  SELF.x := x;
  SELF.y := y;

  //Map function here
  //A second  functino is required for syntax purposes
	//Lib.arctan can be ignored
  SELF.result := map(funcName = 'LDEXP' 	=> 	Lib.ldexp(x,y),
                   													Lib.arctan(x));
																																									
   
  // Use modulo to count e.g. 1, 2, 1, 2
  
  SELF.expected := expt[((c-1) % COUNT(testPoints)) + 1];
  SELF.errors := IF(ABS(SELF.result - SELF.expected) > epsilon, 1, 0);
END;

// JOIN together the test function and the data, so that we have one record per data point per function

allTests := JOIN(allTF, testPoints, TRUE, TRANSFORM(tdExp, SELF := LEFT, SELF := RIGHT), ALL);

// Now run the test
results := PROJECT(allTests, doAny(LEFT, COUNTER));   
OUTPUT(results, NAMED('Results'));

