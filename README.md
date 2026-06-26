# Pokémon Gym Hologram

This prototype is an interactive Pepper’s Ghost style hologram display. A physical Pokéball is placed onto a contact-based scanner, where an Arduino reads a resistor value hidden inside the Pokéball. Each resistor value acts as a unique ID for a different Pokémon. The Arduino sends the detected Pokémon name to a Processing sketch over Serial, which plays the corresponding hologram animation for 10 seconds before returning to a black idle screen.

## Features

- Pepper’s Ghost hologram display
- Two animated Pokémon hologram videos
- Arduino-based physical input
- Resistor-coded Pokéballs for unique object detection
- Processing video playback
- Automatic return to black idle state

## Hardware

- Arduino Uno
- Breadboard
- Jumper wires
- Resistors
- Aluminium foil contact pads
- Pokéballs
- Pepper’s Ghost Gym

## Software

- Arduino IDE
- Processing

## Interaction Flow

1. The display starts on a black idle screen.
2. A Pokéball is placed on the scanner contacts.
3. Arduino reads the resistor value.
4. Arduino sends either `PIKACHU` or `SQUIRTLE` through Serial.
5. Processing receives the message and plays the matching hologram video.
6. After 10 seconds, the screen returns to black.

## Notes

The original concept used RFID-tagged Pokéballs. During testing, the MFRC522 reader powered on and communicated with the Arduino, but tag detection was unreliable. The final prototype uses resistor-coded physical contacts as a more reliable alternative while preserving the same interaction concept: each physical Pokéball uniquely triggers a different hologram.
