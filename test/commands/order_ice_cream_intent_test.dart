import 'package:flutter_test/flutter_test.dart';
import 'package:pc_command/commands/order_ice_cream_intent.dart';
import 'package:pc_command/models/ice_cream_model.dart';

void main() {
  test('OrderIceCreamIntent should correctly encapsulate the flavor', () {
    const IceCreamModel iceCream = IceCreamModel('Vanilla', 'Large');
    const OrderIceCreamIntent intent = OrderIceCreamIntent(iceCream);

    expect(intent.flavor, iceCream);
  });
}
