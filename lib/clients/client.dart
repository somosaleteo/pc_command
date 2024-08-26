import '../commands/order_ice_cream_command.dart';
import '../entities.dart';
import '../invokers/waiter_invoker.dart';
import '../models/ice_cream_model.dart';
import '../receivers/ice_cream_shop_receiver.dart';

void main() {
  final IceCreamShopReceiver shopReceiver = IceCreamShopReceiver();
  final WaiterInvoker waiterInvoker = WaiterInvoker();

  final Command vanillaOrder = OrderIceCreamCommand(
    iceCreamModel: const IceCreamModel('Vanilla', 'Large'),
    receiver: shopReceiver,
  );
  final OrderIceCreamCommand chocolateOrder = OrderIceCreamCommand(
    iceCreamModel: const IceCreamModel('Chocolate', 'Medium'),
    receiver: shopReceiver,
  );

  waiterInvoker.takeOrder(vanillaOrder);
  waiterInvoker.takeOrder(chocolateOrder);

  print('--- Current Orders ---');
  shopReceiver.showOrders();

  waiterInvoker.undoLastOrder();

  print('--- Orders after Undo ---');
  shopReceiver.showOrders();
}
