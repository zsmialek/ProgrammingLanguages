/*
JavaScript examples

Lots of small functions used in conjunction with 
the single JavaScript lecture and JavaScript.pptx

Include the following script line in html:
<script src="program0_All.js"></script>
*/
document.writeln("GETTING STARTED");

// Simple ways to display results
document.writeln('Hello World');
console.log ("hello");
/* 
Object as mutable keyed collection
*/
var my_cat = {
	name: "Geronimo",
	"coat-color": "orange"
};

document.writeln("Simple Object Example");
document.writeln(my_cat.name);
document.writeln(my_cat["coat-color"]);
// undefined if access property not specified
document.writeln(my_cat["color"]);
// dot notation doesn't work if need quotes
//document.writeln(my_cat.coat-color);

/*
Adding a property
*/
document.writeln("Adding age property");
my_cat.age = 3;
document.writeln(my_cat.age);
// If not specified, prototype is Object
document.writeln(Object.getPrototypeOf(my_cat));

/*
Simple prototype example
*/
// null - no prototype specified
var cat = Object.create(null);
// adding a property to cat
Object.defineProperty(cat, 'sound', 
	{value: "meow", writeable: true });
// create a new object with cat as prototype
var stray_cat = Object.create(cat);
// add a 'name' property, new syntax
Object.defineProperty(stray_cat, 'name', {value: "Sigfried", writeable: true});
// add a coat-color property
stray_cat['coat-color'] = "tuxedo";
document.writeln(stray_cat['name']);
document.writeln(stray_cat['coat-color']);
// obtained from prototype
document.writeln(stray_cat['sound']);

/*
Augmenting the basic types, from page 32 of JTGP
but simpler syntax in http://stackoverflow.com/questions/6868883/augmenting-types-in-javascript
*/
Number.prototype.integer = function(){ 
  return Math[this < 0 ? 'ceil' : 'floor'](this); 
} 
document.writeln("\nAUGMENTING THE BASIC TYPES");
document.writeln(10/3);
document.writeln((-10 / 3).integer()); 
document.writeln((10 / 3).integer()); 

/*
Another example, augmenting an object
*/
o1 = {x: 2}; 
Object.prototype.doSomething = function() { document.writeln("Just do it!"); }
document.writeln("\nAUGUMENTING OBJECT");
// Notice doSomething can now be called for any object
o1.doSomething();
o2 = {y: 3};
o2.doSomething();

/*
Introduction to functions (page 27, JTGP)
*/
var add = function(a, b) {
  return a + b;
}
document.writeln("\nBASIC FUNCTION");
document.writeln("Adding 5, 6: " + add(5,6));
/*
Four invocation patterns: method, function, ctor, apply
*/
/*
Method invocation (page 28, JTGP)
*/
var myObject = {
  value: 0,
  increment: function(inc) {
	this.value += typeof inc === 'number' ? inc : 1;
  }
};
document.writeln("\nMETHOD INVOCATION");
myObject.increment();
document.writeln("Incremented myObject value: " + myObject.value);
myObject.increment(3);
document.writeln("myObject value incremented by 3: " + myObject.value);

/*
Constructor invocation (page 29)
*/
// Note capital letter in name, intend to be used with new
var Quo = function(string) {
	this.status = string;
};
// Must have prototype, otherwise not shared with 
// new object. 
Quo.prototype.get_status = function() {
	return this.status;
};
// Quo is a function object
// Putting new in front of it causes a new 
// object to be created – weird!
document.writeln("\nCONSTRUCTOR INVOCATION");
var myQuo = new Quo("confused");
document.writeln(myQuo.get_status());

/*
Apply invocation function
*/
function sum() { 
    var result = 0; 
    // note the use of the arguments array
    for (var i = 0; i < arguments.length; i++) { 
        result += arguments[i]; 
    } 
    return result; 
} 
var args = [1,2,3];
// first argument to apply is the context
// second is an array
res = sum.apply(null, args); // will return 6
document.writeln("\nAPPLY INVOCATION");
document.writeln(res);

/*
Apply Invocation with context
Apply and Call example
http://doctrina.org/Javascript-Function-Invocation-Patterns.html
*/
var obj = {
    data:'Hello World'
}
// Try this with data commented out
data = 'Howdy';
var displayData = function() {
    document.writeln(this.data);
}
document.writeln("\nAPPLY & CALL");
displayData(); //undefined or value of global
displayData.apply(obj); //Hello World
// With no parameters, apply and call look the same
displayData.call(obj); 

/*
Another apply & call example, actually shows passing differences
 http://javascript.about.com/od/byexample/a/objectoriented-call-apply-example.htm
*/
var x, o1, o2, r1, r2, r3; 
// global x, used if no other context specified
x = 4; 
// objects used to provide context
o1 = {x: 2}; 
o2 = {x: 7}; 
  
f = function(m, n) {return m * n * this.x;}; 
  
r1 = f(3, 1); 
r2 = f.call(o1,3, 1); 
r3 = f.apply(o2,[3, 1]); 
document.writeln("\nAPPLY & CALL WITH ARGS");
document.writeln(r1);
document.writeln(r2);
document.writeln(r3);
console.log(r1);
/*
How is this useful? Two examples I brainstormed:
-- say a greeting 
-- update health value
requires: 
o1 = {x: 2}; 
*/
// Say a greeting to any object with a name
say_hello = function() { return "Hello " + this.name; }
// Add random health to any object with health
inc_health = function() { this.health = 	Math.floor((Math.random() * 100) + 1); }
// Assumes o1 already exists as an object
o1.name = "Cyndi";
o1.health = 5;
document.writeln("\nAPPLY & CALL USAGE BRAINSTORM");
document.writeln(say_hello.call(o1));
inc_health.call(o1);
document.writeln("New health value: " + o1.health);
/*
Scope example (page 36)
*/
var foo = function() {
	var a=3, b=5;
	var bar = function() {
		var b=7, c=11;
		a += b + c;
		// b and c are local to function
		document.writeln("a: " + a + " b: " + b + " c: " + c);
	} // end of bar
	bar();
	// b is local to foo
	document.writeln("a: " + a + " b: " + b);	
}
document.writeln("\nSCOPE EXAMPLE");
foo();

/*
Issues with inner functions (adapted from page 29)
Makes use of add function defined above:
var add = function(a, b) {
  return a + b;
}

*/
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

/*
 Book example of common workaround
 requires:
 var add = function(a, b) {
  return a + b;
}
var anObject = {
  value: 4,
};
*/ 
anObject.double = function() {
	var that = this;
	var helper = function() {
		that.value = add(that.value, that.value);
	};
	
	helper();
};

document.writeln("\nWORKAROUND FOR INNER FUNCTION");
document.writeln("before double");
document.writeln(anObject.value);
anObject.double();    
document.writeln("after double");
document.writeln(anObject.value);

/*
Example I created to highlight first-class functions
Just add this to prior example (needs: add, double, doubleIt, anObject)
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
anObject.someFn(anObject.double);

/*
No block scope in JavaScript
http://lostechies.com/jimmybogard/2008/09/26/javascript-block-scoping
*/
var foo2 = function() { 
  if (true) { 
      var a = 5; 
  } 
  document.writeln(a); 
} 
document.writeln("\nNO BLOCK SCOPE IN JAVASCRIPT");
foo2();

/*
Closures (page 38, JTGP)
*/
var quo2 = function(status) {
  // returning an object with get_status method
  return {
	// even after quo2 ends, will have access to 
	// copy of parameter, via the context 
	get_status: function() {
		return status;
	}
  };
};

var myQuo = quo2("amazed");
document.writeln("\nCLOSURES WITH NEW OBJECT");
document.writeln(myQuo.get_status());
// can change status, but get_status function is "closed over"
myQuo.status = "dazed";
document.writeln(myQuo.get_status());
document.writeln(myQuo.status);

// Another example of closure (page 38)
var fade = function (node) {
  var level = 1;
  // setting level to 1 vs 500 is obvious difference
  //var level = 500;
  var step = function() {
    var hex = level.toString(16);
	node.style.backgroundColor = '#FFFF' + hex + hex;
	if (level < 15) {
	  level += 1;
	  setTimeout(step, 100);
	}
  };
  // will call step after 100 milliseconds (1/10th sec)
  // fade already returned, but its variables (e.g., level) 
  // live on inside this closure.
  //
  // level is part of "closure" - has reference - we can change
  //level = 500;
  setTimeout(step, 100);
 };
 // this level is not the same as in the closure, has no effect
 level = 500;
 fade(document.body);
 
 /*
	Use closures to "protect" variables
*/ 

var addScore = (function(points) {
	var score = 0;
	return function (points) {
		return score+=points;}
	})()

document.writeln("PROTECTING SCORE IN A CLOSURE");
document.writeln(addScore(5));
document.writeln(addScore(7));

var scoreChanger = (function(points){
  var score = 0;
  var operation = {
	add: function(points) {return score += points;},
	sub: function(points) {return score -= points;},
	mult: function(points) {return score *= points;},
	div: function(points) {return score /= points;}
	}
	return operation;
	}) ()
	
scoreChanger.add(1);
document.writeln("PROTECTING SCORE IN A CLOSURE, VARIOUS OPS");
document.writeln(scoreChanger.add(2));
document.writeln(scoreChanger.mult(5));

 /*
 Memoization (pages 44-45)
 */
 
call_count = 0;
// Typical recursive fibonacci function
var fibonacci = function(n) {
	call_count += 1;
	return n < 2 ? n : fibonacci(n-1) + fibonacci(n-2);
};

document.writeln("\nNAIVE FIBONACCI");
for (var i=0; i<=10; i += 1) {
	document.writeln('// ' + i + ':' + fibonacci(i));
}
document.writeln("count of calls to calculate fib(0)..fib(10): " + call_count);

call_count = 0;
document.writeln('\nJust calculate fibonacci(10)' + fibonacci(10));
document.writeln("count of calls for just fib(10): " + call_count);

var fib_count = 0;
var fibonacci2 = function() {
   var memo = [0,1];
   var fib = function(n) {
     fib_count += 1;
	 // use memoized result, if available
     var result = memo[n];
	 // calculate if not available
	 if (typeof result != 'number') {
	   result = fib(n-1) + fib(n-2);
	   memo[n] = result;
	 }
	 return result;
   };
   return fib;
}();
document.writeln("\nMEMOIZED FIBONACCI");
for (var i=0; i<=10; i += 1) {
	document.writeln('// ' + i + ':' + fibonacci2(i));
}
document.writeln("count of calls memoized fib(0)..fib(10): " + fib_count);

// do some counts on single fib calculations
fib_count = 0;
document.writeln('\nJust calculate fibonacci2(10): ' + fibonacci2(10));
document.writeln("count of calls: " + fib_count);

fib_count = 0;
document.writeln('\nJust calculate fibonacci2(11): ' + fibonacci2(11));
document.writeln("count of calls: " + fib_count);


var memoizer_count = 0;
// General purpose memoizing function
var memoizer = function (memo, fundamental) {
  var shell = function(n) {
    var result = memo[n];
	if (typeof result != 'number') {
	  // count the number of calls
 	  memoizer_count += 1;
      // Notice call to arbitrary function 
	  result = fundamental(shell, n);
	  memo[n] = result;
	}
	return result;
  };
  return shell;
};

var fibonacci3 = memoizer([0,1], function(shell, n) {
  return shell(n-1) + shell(n-2);
});
document.writeln("\nUSING MEMOIZER WITH FIBONACCI");
document.writeln("Fibonacci 10: " + fibonacci3(10)); 
document.writeln("Number of calls: " + memoizer_count);

memoizer_count = 0;
var factorial = memoizer([1,1], function(shell, n) {
  return n * shell(n-1);
});
document.writeln("\nUSING MEMOIZER WITH FACTORIAL");
document.writeln("Factorial 5: " + factorial(5));   
document.writeln("Number of calls: " + memoizer_count);
