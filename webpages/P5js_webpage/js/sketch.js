var col = "grey";
var cwidth = 80;
var cheight = 80;

function setup() {
	createCanvas(640, 480);
}

function getRandomColor() {
  var letters = '0123456789ABCDEF';
  var color = '#';
  for (var i = 0; i < 6; i++) {
    color += letters[Math.floor(Math.random() * 16)];
  }
  return color;
}

function getRandomDimension() {
	return 10 + Math.floor(Math.random() * 80);
}

function draw() {
	if (mouseIsPressed) {
		fill(getRandomColor()); /* col); */
	} else {
		fill("white");
	}
	cwidth += (Math.floor(Math.random() * 10) - 5);
	cheight += (Math.floor(Math.random() * 10) - 5);
	cwidth = Math.max(cwidth, 10);
	cheight = Math.max(cheight, 10);
	cwidth = Math.min(cwidth, 100);
	cheight = Math.min(cheight, 100);
	ellipse(mouseX, mouseY, cwidth, cheight);
}

