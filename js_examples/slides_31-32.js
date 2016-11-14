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
