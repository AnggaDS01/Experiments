#include <Wire.h>
#include <BH1750.h>

BH1750 lightMeter;

int drivePin = 3; // PWM output connected to LED driver circuit
float area = 1.0; // Area in square meters (assumed 1 square meter for simplicity)
int currentLux = 0;

void setup() {
  Serial.begin(9600);

  // Initialize the I2C bus (BH1750 library doesn't do this automatically)
  Wire.begin();
  
  lightMeter.begin();
  pinMode(drivePin, OUTPUT);

  Serial.println(F("BH1750 Test begin"));
}

void loop() {
  currentLux = lightMeter.readLightLevel();
  Serial.print("Current Light: ");
  Serial.print(currentLux);
  Serial.println(" lux");
  
  if (currentLux < 300) {
    adjustLedBrightness(330);
  } else if (currentLux < 100) {
    adjustLedBrightness(665);
  } else if (currentLux < 50) {
    adjustLedBrightness(1000);
  }
  
  delay(1000); // Wait for 1 second before taking another reading
}

void adjustLedBrightness(int targetLumens) {
  // Convert target lumens to lux based on the area
  int targetLux = targetLumens / area;

  // Map target lux to PWM value
  int pwmValue = map(targetLux, 0, 1023, 0, 255); // Adjust mapping as necessary
  analogWrite(drivePin, pwmValue);

  Serial.print("Target Lumens: ");
  Serial.println(targetLumens);
  Serial.print("PWM Value: ");
  Serial.println(pwmValue);
}
