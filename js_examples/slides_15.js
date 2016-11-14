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
o1 = {x: 2}; 
// See the following in the JS browser
o1.increment();
