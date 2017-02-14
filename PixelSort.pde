PImage img;
PImage sorted;
int index = 0;
void setup () {
  size(1500, 1000);
  img = loadImage("sunflower.jpg");
  sorted = createImage(img.width, img.height, RGB);
  sorted = img.get();
}

void draw () {
  sorted.loadPixels();
  int selectedPixel = index;
  float temp_max = -1;
    
  for (int j = index; j < sorted.pixels.length; j++){
    color pix = sorted.pixels[j];
    float b = hue(pix);
    if (b > temp_max){
      temp_max = b;
      selectedPixel = j;
    }
  }
  color temp = sorted.pixels[index];
  sorted.pixels[index] = sorted.pixels[selectedPixel];
  sorted.pixels[selectedPixel] = temp; 
    
  if (index < sorted.pixels.length -1){
    index++;
  }
  
  sorted.updatePixels();
  
  background(0);
  image(img, 0, 0);
  image(sorted, 751, 0);
}