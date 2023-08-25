// the dynamic backgroud feature of the app
// is handled by this piece of code
import 'dart:math';

List<String> imagelinks = [
  "assets/images/bgimage_1.jpg",
  "assets/images/bgimage_2.jpg",
  "assets/images/bgimage_3.jpg",
  "assets/images/bgimage_4.jpg",
];
var random = Random();
//to shuffle the images
void shuffleimagelinks() {
  imagelinks.shuffle();
}
