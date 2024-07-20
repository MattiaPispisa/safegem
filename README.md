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

The application is designed in 4 layers: **domain**, **data**, **application**, **presentation**.

**Domain**: Defines the service interfaces and domain models for `safegem`. The service methods are managed with a functional approach to avoid handling exceptions on the application side since these are mapped to failures in advance. Since `void` is a keyword used to have a generic behavior the same for everyone, `unit` is used instead of `void`. This way, each service method returns an `object`. All domain models are immutable and extend Equatable, allowing for comparison by properties rather than by reference. This is very useful for optimizing rendering in both application and presentation phases.

**Data**: Implements the domain services and encapsulates the libraries used for the project: `google_generative_ai` and `speech_to_text`. This makes it easy to change the concrete implementation. For example, in Italy, `google_generative_ai` is not freely available (as it is in the USA), so most tests within the app have been performed using a mocked implementation of the AI service. In the future, where "google_generative_ai" is unavailable, another AI could be used. In addition, the service for composing emergency messages is not necessarily tied to artificial intelligence; a different concrete implementation could potentially use other technologies in the future. Although, at the moment, I find it difficult to achieve this level of precision with a system other than artificial intelligence.

**Application**: Defines the business logic of the application. These are primarily implemented using `BLoC`. Concrete services, like the BLoCs, are obtained through dependency injection using `getIt` as a service locator.

**Presentation**: Handles the widget, routing, theming, and localization aspects of the application. Here, routing is also managed through `getIt`.

To maintain high code quality, `very_good_analysis` has been included as a linter to ensure 100% API documentation.

## Test

I started creating application tests by setting up some utilities that will definitely be useful for future tests, making them faster to write.

The tests follow the robot design pattern to ensure easy readability and high reusability in future tests.

## The future

Currently, all the call to actions lead to system applications (using `urlLauncher` to open the specific app). It would be interesting to perform operations directly on `Safegem` after the AI generates the response. However, this would require a more in-depth analysis and the writing of native code (the current libraries are outdated), which demands more time than is available.
