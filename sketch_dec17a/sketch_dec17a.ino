#include <Servo.h>
#include <Wire.h>
#include <LiquidCrystal.h>
const int rs = 12, en = 11, d4 = 5, d5 = 4, d6 = 3, d7 = 2;
LiquidCrystal lcd(rs, en, d4, d5, d6, d7);
Servo doorServo;
const int servoPin = 6;
const int reedPin = 9;
const int buzzerPin = 7;
const int ledgreenPin = 8;
const int ledredPin = 10;
int count = 0;
char c;
String id;
void setup() {
  Serial.begin(9600);
  lcd.begin(16, 2);
  lcd.print("Smart Entry/Exit");
  delay(2000);
  lcd.clear();
  lcd.print("Enter RFID tag");

 doorServo.attach(servoPin);
 doorServo.write(0);

 pinMode(ledgreenPin, OUTPUT);
 pinMode(ledredPin, OUTPUT);
 pinMode(reedPin, INPUT);
 pinMode(buzzerPin, OUTPUT);
 digitalWrite(buzzerPin, LOW);
}
void loop() {
  while(Serial.available()>0)
  {
    c = Serial.read();
   count++;
   id += c;
   if(count == 12)  
    {
      Serial.print(id);
      
      if(id=="1234578900bn")
      {
        Serial.println("Valid TAG");
        lcd.clear();
        lcd.print("Access Granted");
        delay(2000);
        digitalWrite(ledgreenPin, HIGH);
        delay(1000);
        digitalWrite(ledgreenPin, LOW);
        lcd.clear();
        lcd.print("Opening door...");
        delay(3000);
        doorServo.write(180);
        delay(5000);
        int reedState = digitalRead(reedPin);  
        if (reedState == HIGH) {  
         lcd.clear();
         lcd.print("Closing door...");
         doorServo.write(0);
        }
      }
      else {
          lcd.clear();
          lcd.print("Access Denied");
          digitalWrite(ledredPin, HIGH);
          delay(1000);
          pinMode(ledredPin, LOW);
          digitalWrite(buzzerPin, HIGH);
          delay(1000);
          digitalWrite(buzzerPin, LOW);
          delay(1000);
          doorServo.write(0);
        }
    }
  }
  count = 0;
  id = "";
  delay(5000);
   
}
      
      
    