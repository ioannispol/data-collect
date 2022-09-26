int ledPin = 13;  // LED
int leakPin = 2;    // Leak Signal Pin
int leak = 0;      // 0 = Dry , 1 = Leak

void setup() {
  pinMode(ledPin, OUTPUT);
  pinMode(leakPin, INPUT);
  Serial.begin(9600);
  Serial.println("D435 camera box leak sensor");
}

void loop() {
  leak = digitalRead(leakPin);   // Read the Leak Sensor Pin
  digitalWrite(ledPin, leak);  // Sets the LED to the Leak Sensor's Value

  if (leak == 1) {
    Serial.println("Leak Detected!");
  }
  else {
    Serial.println("No Leak!");
  }
   delay(3000); 
}
