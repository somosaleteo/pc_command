import 'package:flutter/material.dart';

import '../models/ice_cream_model.dart';

/// [OrdersWidget] is a StatelessWidget that displays a list of orders in a row.
///
/// Each order is shown inside a card with the flavor and size of the ice cream.
///
/// Example:
/// ```dart
/// final orders = [
///   IceCreamModel('Vanilla', 'Large'),
///   IceCreamModel('Chocolate', 'Medium'),
/// ];
/// OrdersWidget(orders: orders);
/// ```.
class OrdersWidget extends StatelessWidget {
  const OrdersWidget({required this.orders, super.key});

  final List<IceCreamModel> orders;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: orders.map((IceCreamModel order) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(order.flavor),
                Text(order.size),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
