import 'package:flutter_test/flutter_test.dart';
import 'package:pc_command/commands/order_ice_cream_action.dart';
import 'package:pc_command/commands/order_ice_cream_intent.dart';
import 'package:pc_command/models/ice_cream_model.dart';

void main() {
  test('OrderIceCreamAction should add the flavor to the orders list', () {
    final List<IceCreamModel> orders = <IceCreamModel>[];
    final OrderIceCreamAction action = OrderIceCreamAction(
      onOrder: (IceCreamModel flavor) {
        orders.add(flavor);
      },
    );

    const OrderIceCreamIntent intent =
        OrderIceCreamIntent(IceCreamModel('Vanilla', 'Large'));
    action.invoke(intent);

    expect(orders.length, 1);
    expect(orders.first.flavor, 'Vanilla');
  });
}
