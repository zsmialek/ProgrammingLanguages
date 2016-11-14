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

// Another scope example
var foo2 = function() { 
  // this is recommended: 
  // var a; 
  if (true) { 
      // but this works
      var a = 5; 
  } 
  alert(a); 
} 
foo2();
