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