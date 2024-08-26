import 'package:flutter_test/flutter_test.dart';
import 'package:pc_command/commands/order_ice_cream_command.dart';
import 'package:pc_command/models/ice_cream_model.dart';
import 'package:pc_command/receivers/ice_cream_shop_receiver.dart';

void main() {
  test('OrderIceCreamCommand should order and cancel ice cream correctly', () {
    final IceCreamShopReceiver receiver = IceCreamShopReceiver();
    const IceCreamModel iceCream = IceCreamModel('Vanilla', 'Large');
    final OrderIceCreamCommand command = OrderIceCreamCommand(
      receiver: receiver,
      iceCreamModel: iceCream,
    );

    command.execute();
    expect(receiver.orders.length, 1);
    expect(receiver.orders.first, iceCream);

    command.undo();
    expect(receiver.orders.length, 0);
  });
}
