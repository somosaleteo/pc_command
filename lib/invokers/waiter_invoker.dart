import '../entities.dart';

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
