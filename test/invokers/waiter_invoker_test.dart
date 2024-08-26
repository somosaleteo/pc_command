import 'package:flutter_test/flutter_test.dart';
import 'package:pc_command/commands/order_ice_cream_command.dart';
import 'package:pc_command/invokers/waiter_invoker.dart';
import 'package:pc_command/models/ice_cream_model.dart';
import 'package:pc_command/receivers/ice_cream_shop_receiver.dart';

void main() {
  test('WaiterInvoker should execute and undo commands correctly', () {
    final IceCreamShopReceiver receiver = IceCreamShopReceiver();
    final WaiterInvoker waiter = WaiterInvoker();

    final OrderIceCreamCommand vanillaOrder = OrderIceCreamCommand(
      receiver: receiver,
      iceCreamModel: const IceCreamModel('Vanilla', 'Large'),
    );

    final OrderIceCreamCommand chocolateOrder = OrderIceCreamCommand(
      receiver: receiver,
      iceCreamModel: const IceCreamModel('Chocolate', 'Medium'),
    );

    waiter.takeOrder(vanillaOrder);
    waiter.takeOrder(chocolateOrder);

    expect(receiver.orders.length, 2);

    waiter.undoLastOrder();
    expect(receiver.orders.length, 1);
    expect(receiver.orders.first.flavor, 'Vanilla');

    waiter.undoLastOrder();
    expect(receiver.orders.length, 0);
  });
}
