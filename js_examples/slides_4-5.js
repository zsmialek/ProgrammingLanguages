// Slides 4-5
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