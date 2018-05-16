/**
 *Test code for single parameter exponential and logarithmic functions. 
 *@param x, a numeric value passed to each function.
 *@return value is numeric.
 */

Import  $.^ as Lib;

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

testPoints := DATASET([{10},
                        {3.5},
			{0.7}], testData);

tf := RECORD
  STRING funcName;
  SET OF REAL expt;
END;

allTF := DATASET([{'Exponential', [22026.465794806,33.115451958,2.013752707]},
		{'Natural Log', [2.302585092,1.252762968,-0.356674943]},
		{'Common Log', [1,0.544068044,-0.154901959]},
		{'Modf', [0,0.5,0.7]},
		{'Binary Exponential', [1024,11.313708498,1.624504792]},
		{'Exponential Minus 1', [22025.465794806,32.115451958,1.013752707]},
		{'Natural Log (X+1)', [2.397895272,1.504077396,0.530628251]},
		{'Binary Log', [3.321928094,1.807354922,-0.514573172]},
		{'Floating Point Log', [3,1,-1]},
		{'Integer Binary Log', [3,1,-1]}], tf);


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
  
  SELF.result := map(funcName = 'Natural Log' 	=> 		Lib.logx(x),
		funcName = 'Exponential' => 			Lib.xpo(x),
                funcName = 'Common Log' => 			Lib.log10(x),
		funcName = 'Modf' => 				Lib.modf(x),
		funcName = 'Binary Exponential' => 		Lib.xpo2(x),
		funcName = 'Exponential Minus 1' => 		Lib.expm1(x),
		funcName = 'Natural Log (X+1)' => 		Lib.log1p(x),
		funcName = 'Binary Log' => 			Lib.log2(x),
		funcName = 'Floating Point Log' => 		Lib.logb(x),
								Lib.ilogb(x));
																						
   
/*Modulo used to count e.g. 1, 2, 1, 2*/
  
  SELF.expected := expt[((c-1) % COUNT(testPoints)) + 1];
  SELF.errors := IF(ABS(SELF.result - SELF.expected) > epsilon, 1, 0);
END;

/*JOIN together the test functions and the data, so that we have one record per data point per function*/

allTests := JOIN(allTF, testPoints, TRUE, TRANSFORM(tdExp, SELF := LEFT, SELF := RIGHT), ALL);

/* All the tests run at once here*/
results := PROJECT(allTests, doAny(LEFT, COUNTER));   
OUTPUT(results, NAMED('Results'));
