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