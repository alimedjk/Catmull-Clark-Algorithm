import controlP5.*;
import peasy.*;

final int EDGE_START_INDEX = 0;
final int EDGE_END_INDEX = 1;

Mesh mesh;

void setup() {
  size(800, 800, P3D);
  PeasyCam cam = new PeasyCam(this, 500);
  initializeMesh(2.0);  // Appel avec un facteur d'échelle de 2.0 (par exemple)
}

void draw() {
  background(255);
  stroke(0);
  fill(150, 150, 150);
  mesh.draw();
}

void initializeMesh(float scale) {
  mesh = new Mesh();
  mesh.addVertex(new PVector(-50 * scale, -50 * scale, -50 * scale));
  mesh.addVertex(new PVector(50 * scale, -50 * scale, -50 * scale));
  mesh.addVertex(new PVector(50 * scale, 50 * scale, -50 * scale));
  mesh.addVertex(new PVector(-50 * scale, 50 * scale, -50 * scale));
  mesh.addVertex(new PVector(-50 * scale, -50 * scale, 50 * scale));
  mesh.addVertex(new PVector(50 * scale, -50 * scale, 50 * scale));
  mesh.addVertex(new PVector(50 * scale, 50 * scale, 50 * scale));
  mesh.addVertex(new PVector(-50 * scale, 50 * scale, 50 * scale));

  mesh.addFace(new int[]{0, 1, 2, 3});
  mesh.addFace(new int[]{4, 5, 6, 7});
  mesh.addFace(new int[]{0, 3, 7, 4});
  mesh.addFace(new int[]{1, 2, 6, 5});
  mesh.addFace(new int[]{3, 2, 6, 7});
  mesh.addFace(new int[]{0, 1, 5, 4});
}
void keyPressed() {
  if (key == 'e' || key == 'E') {
    mesh.catmullClarkSubdivision();
  }
}
