// Slides 6-8
// REQUIRES slides 4-5 for definition of Cat

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
