# safegem

## Introduction

The application is called `safegem`. `Safe` signifies that you will be secure, while `gem` (from `Gemini`) represents it as your precious gem that provides safety.

The application is designed to simplify communication with the appropriate authorities in moments of danger for you or **those around you**.

## How it works

Through a button, the application starts listening to the user who, after finishing the sentence, converts the speech into text. At this point, the text is used to compose queries to the AI.

The AI has several functionalities:

- It determines the most suitable emergency contact number based on your location and the type of emergency message;
- In emergency situations, messages may not always be clear and concise; the AI can correct and clarify the text;
- If the local language is different from yours, the AI will translate the message content into the local language to assist the authorities.

## Use case

I am Italian and traveling to Austria. I am in a country where they don't speak my language, and I may not know all the local emergency numbers. A request for assistance will be analyzed to find the most appropriate authority and to translate the message into German (using local phrases).

- Speech to text: "Mi sono ferito al braccio" (I have been injured in the arm.)

- `Query 1`: I am at the following geographic coordinates: latitude 47°04′15″ longitude 15°26′19″. This is happening: "Mi sono ferito al braccio". Give me the phone number of the most appropriate authority in the following format: authority name: number, don't write anything else.

- `IA 1`: Emergency Medical Services (Rettungsdienst): 144

- `Query 2`: Translate into the local language of the geographic coordinates; latitude 47°04′15″ longitude 15°26′19″:

  I am at the following geographic coordinates: latitude latitude 47°04′15″ longitude 15°26′19″. This is happening: "Mi sono ferito al braccio". Don't write anything else besides the translated message.

- `IA 2`: Ich befinde mich an den geografischen Koordinaten: Breitengrad 47°04′15″, Längengrad 15°26′19″. Ich habe mir den Arm verletzt.

The user will be presented with the translated message along with the phone number, accompanied by a call to action to open messages with the ready-to-send message and various shortcuts to call/write to the number.

## Architecture

## The future
