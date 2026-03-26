function setup() {
  createCanvas(windowWidth, windowHeight);
  textFont('Arial');
  textAlign(CENTER, CENTER);
   background(245);
  
  translate(50, 100)

  drawWork("Terminvox", "Andrey", width * 0.1, width * 0.1 - 65, 200, "https://berlogabob.github.io/terminvox/")
  
  drawWork("All Eyes on You", "Inge", width * 0.25, width * 0.25 - 65, 200, "https://editor.p5js.org/_ina.luma_/full/H38VUTeaW")
  
  drawWork("Patient Quilt", "Nadine", width * 0.4, width * 0.4 - 65, 200, "https://editor.p5js.org/naydino/full/Uvk1SvGQd")
  
  drawWork("Ink Police", "Nadine", width * 0.55, width * 0.55 - 65, 200, "https://editor.p5js.org/naydino/full/9Q6PxRYjE")
  
  drawWork("Audio Engine", "Max Cave", width * 0.7, width * 0.7 - 65, 200, "https://editor.p5js.org/naydino/full/ZMzXXFadt")
  
  drawWork("Snake Agent", "João Filipe", width * 0.85, width * 0.85 - 65, 200, "https://editor.p5js.org/naydino/full/RKH015k-5")
}

function drawWork(work, student, posx, bx, by, url) {
  
  fill(30);
  textSize(50);
  text(work, posx, 100)

  textSize(40);
  text(student, posx, 150);

  let button = createButton('Open');
  button.position(bx+55, by + 100);
  button.size(200, 55)
  button.mousePressed(function() {
      window.open(url, "_blank");
    });
}

function draw() {
 
}

function drawButton(x, y, w, h, label) {
  let hovering = mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;

  stroke(30);
  strokeWeight(2);
  fill(hovering ? 220 : 255);
  rect(x, y, w, h, 12);

  noStroke();
  fill(20);
  textSize(14);
  text(label, x + w / 2, y + h / 2);
}
