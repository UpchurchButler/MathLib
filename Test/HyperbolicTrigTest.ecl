/** 
*Test code for hyperbolic trig functions. 
*@param x, a numeric value passed to each function.
*@return value is in DEGREES.
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

testPoints := DATASET([{3},
                        {2},
			{0.5}], testData);

tf := RECORD
  STRING funcName;
  SET OF REAL expt;
END;

allTF := DATASET([{'Hyperbolic Sine', [573.981953030,207.803794252,29.856561728]},
		  {'Hyperbolic Cosine', [576.834541922,215.557934801,64.608208675]},
		  {'Hyperbolic Tangent', [57.012437770,55.234711672,26.477362751]},
		  {'Area Hyperbolic Sine', [104.189307384,82.714219883,27.571406627]},
		  {'Area Hyperbolic Cosine', [100.997973421,75.456129290,0]},
		  {'Area Hyperbolic Tangent', [0,0,31.472923730]}], tf);

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
  
  SELF.result := map(funcName = 'Hyperbolic Sine' => 		Lib.hsin(x),
                     funcName = 'Hyperbolic Cosine' => 		Lib.hcos(x),
		     funcName = 'Hyperbolic Tangent' => 	Lib.htan(x),
	             funcName = 'Area Hyperbolic Cosine' => 	Lib.hcosa(x),
		     funcName = 'Area Hyperbolic Sine' => 	Lib.hsina(x),
								Lib.htana(x));
																						
   
/*Modulo used to count e.g. 1, 2, 1, 2*/
  
  SELF.expected := expt[((c-1) % COUNT(testPoints)) + 1];
  SELF.errors := IF(ABS(SELF.result - SELF.expected) > epsilon, 1, 0);
END;

/*JOIN together the test functions and the data, so that we have one record per data point per function*/

allTests := JOIN(allTF, testPoints, TRUE, TRANSFORM(tdExp, SELF := LEFT, SELF := RIGHT), ALL);

/* All the tests run at once here*/
results := PROJECT(allTests, doAny(LEFT, COUNTER));   
OUTPUT(results, NAMED('Results'));

 
