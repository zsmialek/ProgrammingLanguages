/*
Issues with inner functions (adapted from page 29)
Makes use of add function defined above:
var add = function(a, b) {
  return a + b;
}

*/
var add = function(a, b) {
  return a + b;
}

var anObject = {
  value: 4,
};
//// Function I created to show the issue
anObject.doubleIt = function() {
	var helper = function() {
		this.value = add(this.value, this.value);
	};
	helper();
};
document.writeln("\nISSUE WITH INNER FUNCTION");
document.writeln("before doubleIt");
document.writeln(anObject.value);
anObject.doubleIt();    
document.writeln("after doubleIt");
document.writeln(anObject.value);

anObject.doubleMe = function() {
	var that = this;
	var helper = function() {
		that.value = add(that.value, that.value);
	};
	
	helper();
};

document.writeln("\nWORKAROUND FOR INNER FUNCTION");
document.writeln("before double");
document.writeln(anObject.value);
anObject.doubleMe();    
document.writeln("after double");
document.writeln(anObject.value);

/*
Example I created to highlight first-class functions
Just add this to prior example (needs: add, double, doubleIt, anObject)
WORKING IN ALL.JS, NOT HERE FOR SOME REASON.
*/
// Notice that the parameter is a FUNCTION (ok because 
// functions are first-class objects
anObject.someFn = function(func) {
	document.writeln("before fn value");
	document.writeln(anObject.value);
	// executes the function passed in as a parameter
	func.call(this);    
	document.writeln("after fn value");
	document.writeln(anObject.value);
};
document.writeln("\nSAME ISSUE & WORKAROUND w FIRST-CLASS FUNCTIONS");
// pass in doubleIt... shows issue with this setting
anObject.someFn(anObject.doubleIt);
// pass in double... shows corrected version using that
anObject.someFn(anObject.doubleMe);