const int sensorPin = A0;

bool hasTriggered = false;

void setup() {
  Serial.begin(9600);
  Serial.println("Ball scanner ready");
}

void loop() {
  int value = analogRead(sensorPin);

  if (value > 450 && value < 570 && !hasTriggered) {
    Serial.println("PIKACHU");
    hasTriggered = true;
    delay(1000);
  }
  else if (value > 0 && value < 80 && !hasTriggered) {
    Serial.println("SQUIRTLE");
    hasTriggered = true;
    delay(1000);
  }
  else if (value > 950) {
    hasTriggered = false;
  }

  delay(100);
}