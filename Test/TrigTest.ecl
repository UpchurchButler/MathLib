/* Test code for basic trig functions 
 *@param x, a degree value passed to each trig function
 *@param y, only used for calculating ArcTan with 2 parameters. 
 * ie ArcTan(y/x)
*/

Import STD as Lib;

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

testPoints := DATASET([{90, 270},
                        {12, 48},
			{0.1,0}], testData);

tf := RECORD
  STRING funcName;
  SET OF REAL expt;
END;

allTF := DATASET([{'Sine', [1,0.207911690,0.001745328]},
		{'Cosine', [0,0.978147600,0.999998476]},
		{'Tangent', [0,0.212556561,0.001745331]},
		{'ArcSine', [0,0,5.739170477]},
		{'ArcCosine', [0,0,84.260829522]},
		{'ArcTan', [89.363406424, 85.236358309,5.710593137]},
		{'ArcTan2', [71.565051177, 75.963756532, 0]}], tf);
 
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

/*Mapping of functions begins here*/
  
  SELF.result := map(funcName = 'Sine' 	=> 	Lib.sine(x),
                    funcName = 'Cosine' => 	Lib.cosine(x),
		    funcName = 'Tangent' => 	Lib.tangent(x),
		    funcName = 'ArcCosine' => 	Lib.arccosine(x),
		    funcName = 'ArcSine' => 	Lib.arcsine(x),
		    funcName = 'ArcTan2' => 	Lib.arctan2(y,x),
						Lib.arctan(x));
																						
/* Modulo used to count e.g. 1, 2, 1, 2*/
  
  SELF.expected := expt[((c-1) % COUNT(testPoints)) + 1];
  SELF.errors := IF(ABS(SELF.result - SELF.expected) > epsilon, 1, 0);
END;

/*JOIN together the test functions and the data, so that we have one record per data point per function*/

allTests := JOIN(allTF, testPoints, TRUE, TRANSFORM(tdExp, SELF := LEFT, SELF := RIGHT), ALL);

/*All the tests run at once now*/
results := PROJECT(allTests, doAny(LEFT, COUNTER));   
OUTPUT(results, NAMED('Results'));
