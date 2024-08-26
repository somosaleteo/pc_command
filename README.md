# Ice Cream Shop App - Command Pattern

This is a Flutter application demonstrating the use of the Command design pattern in a simple ice cream shop scenario.

## Overview

The app allows users to order vanilla or chocolate ice creams and provides the ability to undo the last order. The implementation follows the Command design pattern, encapsulating requests as objects, which allows for parameterizing clients with different requests, queuing them, and providing the option to undo operations.

## Getting Started

### Prerequisites

- Flutter SDK: Ensure you have Flutter installed on your machine.

### Running the App

To run the app, navigate to the root directory of the project and execute:

```bash
flutter run
```
## Project Structure

- commands/: Contains the Command interface and the OrderIceCreamCommand class.
- invokers/: Contains the WaiterInvoker class responsible for executing and undoing commands.
- receivers/: Contains the IceCreamShopReceiver class that handles the logic of ordering and canceling ice creams.
- models/: Contains the IceCreamModel class representing the ice cream entity.
- clients/: Contains the ClientPage class, a StatefulWidget that provides the UI for the ice cream shop.

## Example Implementation

Here's an example of how to use the ClientPage in your app:

```dart
import 'package:flutter/material.dart';
import 'clients/client_page.dart';

void main() {
  runApp(MaterialApp(
    home: ClientPage(),
  ));
}
```

## How It Works

1. ClientPage: The main user interface, where users can order vanilla or chocolate ice creams and undo the last order. The orders are displayed in a row.

2. Command Pattern:
   - OrderIceCreamCommand: Implements the Command interface. This class encapsulates the request to order and undo an ice cream order.
   - WaiterInvoker: This class holds a list of commands and is responsible for executing and undoing them.
   - IceCreamShopReceiver: Handles the logic for adding and removing ice cream orders.

## Unit Tests

Unit tests have been added to ensure the functionality of each component. You can run the tests using:
```bash
flutter test
```

## Advantages

- Undo functionality: The Command pattern allows for undoing operations easily.
- Encapsulation: Requests are encapsulated as objects, making the code more modular and extensible.

## Disadvantages

- Complexity: The pattern can introduce unnecessary complexity for simple use cases.

## License

This project is licensed under the MIT License.