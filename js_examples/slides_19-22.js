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
o1 = {x: 2}; 
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