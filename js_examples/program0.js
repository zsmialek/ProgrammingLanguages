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
 