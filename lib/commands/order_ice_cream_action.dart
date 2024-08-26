import 'package:flutter/material.dart';

import '../models/ice_cream_model.dart';
import 'order_ice_cream_intent.dart';

/// [OrderIceCreamAction] es una clase que define la acción a tomar cuando se recibe
/// una `OrderIceCreamIntent`.
///
/// Esta acción agrega el sabor del helado a la lista de órdenes.
///
/// Example:
/// ```dart
/// final action = OrderIceCreamAction(onOrder: _handleOrder);
/// Actions.invoke(context, OrderIceCreamIntent(IceCreamModel('Vanilla', 'Large')));
/// ```.

class OrderIceCreamAction extends Action<OrderIceCreamIntent> {
  OrderIceCreamAction({required this.onOrder});

  final ValueChanged<IceCreamModel> onOrder;

  @override
  void invoke(covariant OrderIceCreamIntent intent) {
    onOrder(intent.flavor);
  }
}
