# Changelog

## [1.1.0] - 2024-08-26
### Added
- Implemented `ClientActionPage` as a `StatefulWidget` utilizing Flutter's `Action` and `Intent` classes.
- Added `OrderIceCreamIntent` to encapsulate the intent of ordering an ice cream.
- Added `OrderIceCreamAction` to handle the action of adding an ice cream order based on the intent.
- Integrated `Actions` and `Intents` into the UI for ordering vanilla and chocolate ice creams and undoing the last order.
- Added unit tests for `OrderIceCreamIntent`, `OrderIceCreamAction`, and `ClientActionPage` to ensure functionality.
- Updated the structure of the project to follow the Command pattern, organizing the new classes into appropriate directories.

## [1.0.0] - 2024-08-26
### Added
- Initial release of the Ice Cream Shop app using the Command design pattern.
- Implemented `Command`, `OrderIceCreamCommand`, `WaiterInvoker`, `IceCreamShopReceiver`, `IceCreamModel`.
- Created `ClientPage` with functionality to order vanilla and chocolate ice creams and undo the last order.
- Added unit tests for `OrderIceCreamCommand`, `WaiterInvoker`, `IceCreamShopReceiver`, and `ClientPage`.
