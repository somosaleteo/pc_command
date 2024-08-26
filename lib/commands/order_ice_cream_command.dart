import '../entities.dart';
import '../models/ice_cream_model.dart';
import '../receivers/ice_cream_shop_receiver.dart';

/// [OrderIceCreamCommand] is a concrete command that orders ice cream by invoking
/// the corresponding method on the receiver.
///
/// It also provides the ability to undo the order.
///
/// Example:
/// ```dart
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
class OrderIceCreamCommand implements Command {
  const OrderIceCreamCommand({
    required this.receiver,
    required this.iceCreamModel,
  });

  final IceCreamModel iceCreamModel;
  final IceCreamShopReceiver receiver;

  @override
  void execute() {
    receiver.orderIceCream(iceCreamModel);
  }

  @override
  void undo() {
    receiver.cancelIceCreamOrder(iceCreamModel);
  }
}
