import '../entities.dart';

/// [WaiterInvoker] is a concrete invoker class that handles the execution of commands
/// and provides functionality to undo the last command executed.
///
/// It maintains a history of commands that have been executed.
///
/// Example:
/// ```dart
/// final WaiterInvoker waiterInvoker = WaiterInvoker();
///
/// final Command vanillaOrder = OrderIceCreamCommand(
///   iceCreamModel: IceCreamModel('Vanilla', 'Large'),
///   receiver: shopReceiver,
/// );
///
/// waiterInvoker.takeOrder(vanillaOrder);
/// print('--- Orders after taking order ---');
/// shopReceiver.showOrders();
///
/// waiterInvoker.undoLastOrder();
/// print('--- Orders after undo ---');
/// shopReceiver.showOrders();
/// ```.

class WaiterInvoker implements Invoker {
  final List<Command> _commandHistory = <Command>[];

  void takeOrder(Command command) {
    _commandHistory.add(command);
    command.execute();
  }

  String undoLastOrder() {
    if (_commandHistory.isEmpty) {
      return '';
    }

    final Command command = _commandHistory.removeLast();
    command.undo();
    print('No orders to undo');
    return 'No orders to undo';
  }
}
