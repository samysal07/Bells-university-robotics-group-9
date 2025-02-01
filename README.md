Smart Entry and Exit System

Overview
This project is a Smart Entry and Exit System that uses an Arduino Uno to control access through RFID authentication, servo motor and reed switch-based door monitoring. It enhances security by allowing only authorized RFID cards to grant entry while displaying real-time status on an LCD screen. LEDs provide visual feedback for access granted or denied.

Features
RFID Authentication – Only authorized RFID cards can unlock the door.
 Servo Motor to automate door locking and unlocking.
Reed Switch for Door Monitoring – Detects if the door is open or closed.
LCD Display – Displays access status and system messages.
LED Indicators – Visual confirmation of successful or denied access.
Secure and Efficient – Ensures controlled entry and exit.

Components Used
Arduino Uno – Microcontroller for processing inputs and outputs.
RFID Module (EM-18) – Reads RFID tags for authentication.
Reed Switches – Detects whether the door is open or closed.
 Servo Motor to automate door locking and unlocking.
LCD Display (16x2 with I2C) – Shows system messages.
LEDs (Red & Green) – Indicate access status.
Resistors – Used for proper LED operation.
Buzzer – Alerts on unauthorized access attempts.

How It Works
1. RFID Card Scan – The user scans an RFID card (A virtual terminal is used in proteus simulation to simulate rfid module by typing the UID:1234578900bn)
2. Authentication – The system checks if the card is authorized.
If valid, the green LED turns on, the LCD displays "Access Granted," and the door unlocks.
If invalid, the red LED lights up, the LCD shows "Access Denied," and a buzzer sounds (if used).
 Servo Motor to automate door locking and unlocking.
4. Door Monitoring – A reed switch detects if the door is open or closed( use logic state to make reed switch read high or low) if door is closed(high) the code will make servo motor lock the door.
5. Exit System – The process is repeated for exit authentication.

Installation & Setup
1. Connect the Components following the circuit diagram.
2. Upload the Code to the Arduino Uno using the Arduino IDE.
3. Install Required Libraries:
#include <Servo.h>
#include <Wire.h>
#include <LiquidCrystal_I2C.h>
4. Modify the Code – Add authorized RFID card UID values in the code.
5. Power the System – Use a power source (USB or adapter).
   
Future Enhancements
1.Use a Database to dynamically update authorized users.
2.Implement a Mobile App for remote access control.

Contributors

[Kolawole Emmanuella Oluwadoyinsolami]

[Team Members :
Olukanni Mofeoluwa Victor
Adewale Nifemi Sijuwade
Keshi Franklin Onyekachi
Oyelowo Abdulmalik Mogbonjubola]


