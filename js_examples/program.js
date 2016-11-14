/*
Lots of small functions used in conjunction with 
the single JavaScript lecture and ppt
*/
document.writeln("GETTING STARTED");

// Simple ways to display results
document.writeln('Hello World');
console.log ("hello");

// Introduction to functions (page 27)
var add = function(a, b) {
  return a + b;
}
document.writeln("\nBASIC FUNCTION");
document.writeln("Adding 5, 6: " + add(5,6));

// Method invocation (page 28)
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

// Issues with inner functions (adapted from page 29)
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
//// Book example of common workaround
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

//// Example I created to highlight first-class functions
anObject.someFn = function(func) {
	document.writeln("before fn value");
	document.writeln(anObject.value);
	func.call(this);    
	document.writeln("after fn value");
	document.writeln(anObject.value);
};
document.writeln("\nSAME WORKAROUND w FIRST-CLASS FUNCTIONS");
anObject.someFn(anObject.doubleIt);
anObject.someFn(anObject.double);

/*
Constructor invocation (page 29)
*/
var Quo = function(string) {
	this.status = string;
};

Quo.prototype.get_status = function() {
	return this.status;
};
document.writeln("\nCONSTRUCTOR INVOCATION");
var myQuo = new Quo("confused");
document.writeln(myQuo.get_status());

// Apply and Call example
// http://doctrina.org/Javascript-Function-Invocation-Patterns.html
var obj = {
    data:'Hello World'
}

data = 'Howdy';
var displayData = function() {
    document.writeln(this.data);
}
document.writeln("\nAPPLY & CALL");
displayData(); //undefined or value of global
displayData.apply(obj); //Hello World
displayData.call(obj);

// Another apply & call example
// : http://javascript.about.com/od/byexample/a/objectoriented-call-apply-example.htm
var x, o1, o2, r1, r2, r3; 
x = 4; 

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

// Two examples I brainstormed
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

// Scope example (page 36)
var foo = function() {
	var a=3, b=5;
	var bar = function() {
		var b=7, c=11;
		a += b + c;
		document.writeln("a: " + a + " b: " + b + " c: " + c);
	}
	bar();
	document.writeln("a: " + a + " b: " + b);	
}
document.writeln("\nSCOPE EXAMPLE");
foo();

// No block scope in JavaScript
// http://lostechies.com/jimmybogard/2008/09/26/javascript-block-scoping
var foo2 = function() { 
  if (true) { 
      var a = 5; 
  } 
  document.writeln(a); 
} 
document.writeln("\nNO BLOCK SCOPE IN JAVASCRIPT");
foo2();

// Closures (page 38)
var quo2 = function(status) {
  return {
	get_status: function() {
		return status;
	}
  };
};

var myQuo = quo2("amazed");
document.writeln("\nCLOSURES WITH NEW OBJECT");
document.writeln(myQuo.get_status());

// Another example of closure (page 38)
var fade = function (node) {
  var level = 1;
  var step = function() {
    var hex = level.toString(16);
	node.style.backgroundColor = '#FFFF' + hex + hex;
	if (level < 15) {
	  level += 1;
	  setTimeout(step, 100);
	}
  };
  setTimeout(step, 100);
 };
 
 fade(document.body);
 
 // Memoization (pages 44-45)
call_count = 0;
var fibonacci = function(n) {
	call_count += 1;
	return n < 2 ? n : fibonacci(n-1) + fibonacci(n-2);
};

document.writeln("\nNAIVE FIBONACCI");
for (var i=0; i<=10; i += 1) {
	document.writeln('// ' + i + ':' + fibonacci(i));
}
document.writeln("count of calls: " + call_count);

var fib_count = 0;
var fibonacci2 = function() {
   var memo = [0,1];
   var fib = function(n) {
     fib_count += 1;
     var result = memo[n];
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
document.writeln("count of calls: " + fib_count);

var memoizer = function (memo, fundamental) {
  var shell = function(n) {
    var result = memo[n];
	if (typeof result != 'number') {
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

var factorial = memoizer([1,1], function(shell, n) {
  return n * shell(n-1);
});
document.writeln("\nUSING MEMOIZER WITH FACTORIAL");
document.writeln("Factorial 5: " + factorial(5));   