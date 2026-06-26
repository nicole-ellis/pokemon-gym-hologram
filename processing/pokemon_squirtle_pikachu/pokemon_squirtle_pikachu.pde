import processing.serial.*;
import processing.video.*;

Serial arduino;

Movie pikachu;
Movie squirtle;
Movie currentMovie;

boolean playing = false;
int startTime = 0;
int playDuration = 10000; // 10 seconds

void setup() {
  fullScreen();
  background(0);

  pikachu = new Movie(this, "Pikachu.avi");
  squirtle = new Movie(this, "Squirtle.avi");

  println("Available serial ports:");
  printArray(Serial.list());

  // If this crashes or picks the wrong port, change the number.
  // On your Arduino IDE it was COM3, so look for COM3 in the printed list.
  arduino = new Serial(this, "COM3", 9600);
  arduino.bufferUntil('\n');
}

void draw() {
  background(0);

  if (playing && currentMovie != null) {
    image(currentMovie, 0, 0, width, height);

    if (millis() - startTime > playDuration) {
      currentMovie.stop();
      currentMovie = null;
      playing = false;
      background(0);
    }
  }
}

void serialEvent(Serial arduino) {
  String message = arduino.readStringUntil('\n');

  if (message != null) {
    message = trim(message);
    println("Received: " + message);

    if (message.indexOf("PIKACHU") != -1) {
      playPokemon(pikachu);
    }

    if (message.indexOf("SQUIRTLE") != -1) {
      playPokemon(squirtle);
    }
  }
}

void playPokemon(Movie movieToPlay) {
  if (currentMovie != null) {
    currentMovie.stop();
  }

  currentMovie = movieToPlay;
  currentMovie.jump(0);
  currentMovie.play();

  playing = true;
  startTime = millis();
}

void movieEvent(Movie m) {
  m.read();
}
