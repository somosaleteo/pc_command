/// An abstract [Command] interface that declares the `execute` and `undo` methods
/// for encapsulating actions as objects.
///
/// Implement this interface to create specific commands.
///
/// Example:
/// ```dart
/// class OrderIceCreamCommand implements Command {
///   final IceCreamShopReceiver receiver;
///   final IceCreamModel iceCreamModel;
///
///   OrderIceCreamCommand(this.receiver, this.iceCreamModel);
///
///   @override
///   void execute() {
///     receiver.orderIceCream(iceCreamModel);
///   }
///
///   @override
///   void undo() {
///     receiver.cancelIceCreamOrder(iceCreamModel);
///   }
/// }
/// ```.
abstract class Command {
  void execute();

  void undo();
}

/// An abstract [Receiver] interface that declares the basic structure for a receiver.
///
/// Receivers are responsible for performing the actual work related to the command.
/// Concrete receivers should implement this interface.
///
/// Example:
/// ```dart
/// class IceCreamShopReceiver implements Receiver {
///   final List<IceCreamModel> orders = <IceCreamModel>[];
///
///   void orderIceCream(IceCreamModel iceCream) {
///     orders.add(iceCream);
///     print('Ordered: $iceCream');
///   }
///
///   void cancelIceCreamOrder(IceCreamModel iceCream) {
///     orders.remove(iceCream);
///     print('Cancelled: $iceCream');
///   }
///
///   List<IceCreamModel> showOrders() {
///     return orders;
///   }
/// }
/// ```.
abstract class Receiver {}

/// An abstract [Invoker] interface that declares methods for executing and undoing commands.
///
/// Invokers are responsible for triggering commands.
/// Concrete invokers should implement this interface.
///
/// Example:
/// ```dart
/// class WaiterInvoker implements Invoker {
///   final List<Command> _commandHistory = <Command>[];
///
///   void takeOrder(Command command) {
///     _commandHistory.add(command);
///     command.execute();
///   }
///
///   String undoLastOrder() {
///     if (_commandHistory.isEmpty) {
///       return 'No orders to undo';
///     }
///     final Command command = _commandHistory.removeLast();
///     command.undo();
///     return 'Order undone';
///   }
/// }
/// ```.
abstract class Invoker {}

abstract class Model {}
