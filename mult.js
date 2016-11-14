function multiply (x) {
  return function (y)   {
    return x * y;
  };
}

var mult6 = multiply(6);
var val = mult6(3);
alert(val); // Returns 18

/**********************************************************************
 * description: This is a basic example of a closure: 
 * 
 *  The outer function returns the inner function.
 *  The value of the first number is remember.
 *  When multiply is called, x is set to 6.  
 *  Always knows the value 6 to be mutiply be with another number.
 *  mult6 assginment will multiply the first number x by the second y.
 *  In this example it is 6 * 3.
 ************************************************************************/
