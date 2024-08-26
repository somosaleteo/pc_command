import 'package:flutter_test/flutter_test.dart';
import 'package:pc_command/models/ice_cream_model.dart';
import 'package:pc_command/receivers/ice_cream_receiver.dart';

void main() {
  test('IceCreamShopReceiver should handle orders correctly', () {
    final IceCreamShopReceiver receiver = IceCreamShopReceiver();
    const IceCreamModel vanillaIceCream = IceCreamModel('Vanilla', 'Large');

    receiver.orderIceCream(vanillaIceCream);
    expect(receiver.orders.length, 1);
    expect(receiver.orders.first, vanillaIceCream);

    receiver.cancelIceCreamOrder(vanillaIceCream);
    expect(receiver.orders.length, 0);
  });
}
