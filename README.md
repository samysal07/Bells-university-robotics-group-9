Smart Entry and Exit System

Overview
This project is a Smart Entry and Exit System that uses an Arduino Uno to control access through RFID authentication and reed switch-based door monitoring. It enhances security by allowing only authorized RFID cards to grant entry while displaying real-time status on an LCD screen. LEDs provide visual feedback for access granted or denied.

Features
RFID Authentication – Only authorized RFID cards can unlock the door.
Reed Switch for Door Monitoring – Detects if the door is open or closed.
LCD Display – Displays access status and system messages.
LED Indicators – Visual confirmation of successful or denied access.
Secure and Efficient – Ensures controlled entry and exit.

Components Used
Arduino Uno – Microcontroller for processing inputs and outputs.
RFID Module (RC522) – Reads RFID tags for authentication.
Reed Switches – Detects whether the door is open or closed.
LCD Display (16x2 with I2C) – Shows system messages.
LEDs (Red & Green) – Indicate access status.
Resistors – Used for proper LED operation.
Buzzer – Alerts on unauthorized access attempts.

How It Works
1. RFID Card Scan – The user scans an RFID card.
2. Authentication – The system checks if the card is authorized.
If valid, the green LED turns on, the LCD displays "Access Granted," and the door unlocks.
If invalid, the red LED lights up, the LCD shows "Access Denied," and a buzzer sounds (if used).
3. Door Monitoring – A reed switch detects if the door remains open for too long, triggering a warning.
4. Exit System – The process is repeated for exit authentication.

Installation & Setup
1. Connect the Components following the circuit diagram.
2. Upload the Code to the Arduino Uno using the Arduino IDE.
3. Install Required Libraries:
#include <SPI.h>
#include <MFRC522.h>
#include <Wire.h>
#include <LiquidCrystal_I2C.h>
4. Modify the Code – Add authorized RFID card UID values in the code.
5. Power the System – Use a power source (USB or adapter).
   Install Required Libraries:

#include <SPI.h>
#include <MFRC522.h>
#include <Wire.h>
#include <LiquidCrystal_I2C.h>
Future Enhancements
1.Add a Servo Motor to automate door locking and unlocking.
2.Use a Database to dynamically update authorized users.
3.Implement a Mobile App for remote access control.

Contributors

[Kolawole Emmanuella Oluwadoyinsolami]

[Team Members :
Olukanni Mofeoluwa Victor
Adewale Nifemi Sijuwade
Keshi Franklin Onyekachi
Oyelowo Abdulmalik Mogbonjubola]


